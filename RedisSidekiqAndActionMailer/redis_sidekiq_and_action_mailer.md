# Redis and Sidekiq

__Objectives__

* Describe what Redis and Sidekiq are useful for, how they work at a high level
* Be able to write a Sidekiq worker
* Use Unicorn as your server
* Send an email using action mailer

## What is Redis?

Redis is a data storage system that stores data in memory.  The data is only written to a single computer and is not guarentteed to be saved  to disk on every request. In other words, if Redis goes down, there may be some data loss. Redis is useful for data that you are ok with losing.  Redis is not a replacement for a relational database.


## Installing And Running Redis

On __OS X__:

```
brew install redis
```
On __Linux__:

```
sudo apt-get install redis
```

To run the Redis server do:

```
redis-server
```
__OR__ try this command if you need a config file:

```
redis-server /usr/local/etc/redis.conf
```

And to interact with Redis in the terminal, run the redis command line interface:

```
redis-cli
```

### Exercise

In the redis-cli, try out some of the available commands defined in the [redis commands document](http://redis.io/commands/#).  In particular, try using the string commands ```GET``` and ```SET``` as well as the list commands ```LPUSH```, ```RPUSH```, and ```LINDEX```.  Also, key commands can be useful.  Try ```KEYS *``` and ```TYPE <keyname>```

## What is Sidekiq?

Sidekiq is a framework for executing background jobs within a rails application.  It is a gem file that runs within your server process so it has access to all of the rails environment, including ActiveRecord models.  Under the covers, Sidekiq uses Redis to store a queue of jobs.  Resque is a very similar technology that was used in the past.  The main difference is that Resque will use more memory than Sidekiq for the same ammount of work.

## Process vs Thread

To help make sense of the upcoming exercise, it is important to differentiate between a process and a thread.  You can think of a program as a process.  It runs separatly from other processes.   The memory that a given process, process A, has cannot be accessed by other processes, process B for example.  

__A process can have many threads__.  A thread is a more light weight way to execute code that does allow shared memory access.  In other words if a program has 2 threads running, thread A can access memory from thread B.  This makes multi threaded programming less safe for the implementor of the code, but potentially faster.

### Exercise

Watch the [railscast on sidekiq](http://railscasts.com/episodes/366-sidekiq).  Discuss sidekiq and when it would be useful.  Implement the code highlighting example from the railscast.  Try __NOT__ to cheat!


## Link Checker Example
We are going to make an app that checks a website to see if it has any dead links on the page.  The website will be very simple.  For a given url, it will get the contents of the page, follow all of the links on that page, and then show the results of the check.

First, create the app:

```
rails new LinkChecker
```

Next edit our routes in ```config/routes.rb```:

```
LinkChecker::Application.routes.draw do
  root 'sites#new'
  get '/sites/new', to: 'sites#new', as: 'new_site'
  post '/sites', to: 'sites#create', as: 'sites'
  get '/sites/:id', to: 'sites#show', as: 'site'
  get '/linkfarm', to: 'sites#linkfarm'
end
```

Add a controller:

```
rails generate controller sites new create show --no-test-framework --no-helper
```
Next, get rid of the files we don't need:

```
rm app/assets/javascripts/sites.js.coffee app/assets/stylesheets/sites.css.scss
rm app/views/sites/create.html.erb
```

Also, open up ```config/routes.rb``` and remove the routes that were created that we do not need.  Your routes.rb file should look just like the routes file above.

Then create the models. In this project we are modeling two things.   There is a website, or a site.  A site is an html page that we want to check for dead links.  A site will have many urls on the site.  So there is a 1 to Many relationship.

```
rails generate model site url:string --no-test-framework
```

```
rails g model link url:string http_response:integer site:belongs_to --no-test-framework
```

Next the models need to know about how they are associated.  In ```app/models/link.rb``` add:

```
belongs_to :site
```

And in ```app/models/site.rb``` add:

```
has_many :links
```

Next, add all the necessary gems to the ```Gemfile```:

```
gem 'pg'

gem 'nokogiri'

gem 'typhoeus'

gem 'dotenv-rails', :groups => [:development, :test]

gem 'rails_12factor', group: :production
```

Also remember to edit ```config/database.yml``` to use postgresql and edit ```config/initializers/secret_token.rb``` to use environment variables instead of exposing the secret keys.  Store the secret key in the .env file instead.

### Link Checker Algorithm

This section provides a brief description of what the link checker will be donig in the controller create method.  Here is an algorithm in puesdo code:

```
Get the parameter for the url to check
Create a site record in the database (Save the url)
Use Nokogiri to get the page and parse the contents
Use Nokogiri to get all anchor tags
For each anchor tag, do:
   Get the href from the anchor tag
   Make sure the href starts with http, https or is a relative path
   Use Typhoeus to get the linked page
   Create a new recored in the DB for the link (Saves link url, and http response code)
end

redirect to the show page for the site
```

### Main Link Checker Code in Create

```
def create
  require 'open-uri'
  url = params.require(:site)[:url]
  site = Site.create(url: url)
  
  contents = Nokogiri::HTML(open(site.url))
  contents.css('a').each do |link|
    link_href = link.attributes['href'].value
    if (link_href.starts_with? '/')
      link_href = site.url + link_href
    end
   
    if (link_href.starts_with? 'http://', 'https://')
      response = Typhoeus.get(link_href)

      site.links.create(url: link_href, http_response: response.response_code)
    end  
  end
  
  redirect_to site_path(site)
end
```

### Exercise

__Discussion__ What is wrong with the performance of the code?  How could it be improved?

### Moving Work to Sidekiq

Since the above logic is very slow, let's move it to a sidekiq task.  First, add a directory called ```app/workers```.  Next, create a file in the workers directory called ```links_worker.rb```.  Now that we have the worker file, lets make some changes to ```app/controllers/sites_controller.rb```.  In the create method, remove all the code that deals with fetching data from a url.  Instead, just have create make a new site in the database and then preform the async task that we want.

```
def create
  url = params.require(:site)[:url]
  site = Site.create(url: url)
  LinksWorker.perform_async(site.id)
  redirect_to site_path(site)
end
```

It's important to note that the perform_async method uses the site.id to identify the work that needs to be done, not the ActiveRecord object itself.  All of the data that is passed to perform async actually has to be written to Redis.  If we pass too complicated of an object, Redis may have problems getting the correct data back.  It's safer and easier to pass the id itself and then look up the object in the worker.

Here is the code for the worker that is mainly copied and pasted from the create method.  The code is in ```app/workers/links_worker.rb```:

```
class LinksWorker
  include Sidekiq::Worker

  def perform(site_id)
    require 'open-uri'
    site = Site.find(site_id)

    contents = Nokogiri::HTML(open(site.url))
    contents.css('a').each do |link|
      link_href = link.attributes['href'].value
      if (link_href.starts_with? '/')
        link_href = site.url + link_href
      end

      if (link_href.starts_with? 'http://', 'https://')
        response = Typhoeus.get(link_href)

        site.links.create(url: link_href, http_response: response.response_code)
      end  
    end
  end
end
```

Now the majority of the work is done in the background with the ```LinksWorker``` class.  

### Testing Workers

Testing a worker is fairly simple because we can run a worker without using sidekiq at all.  To manually test, open up `rails c` and call the worker.  In the LinkWorker example, the code would be:

```
site = Site.first
LinksWorker.new.perform(site.id)
```

You can also add a spec for the worker.  For the link worker spec, the file would be `spec/workers/links_worker_spec.rb`.  Here is the code:

```
require 'spec_helper'

describe "LinksWorker" do
	describe "Perform check url" do
		let(:data){ {url: "https://www.google.com"} }
		it "Gets a page and puts all the urls in the database" do
			site = Site.create(data)
			LinksWorker.new.perform(site.id)
			site.links.should_not be_nil
			site.links.length.should > 0
		end
	end
end
```

## Unicorn

Up until now, we have used the Thin web server.  It is a reliable web server, that works for development, but does not work in the real world.  The problem is that Thin can only accept one connection at a time.  This section describes switching to the Unicorn web server.

### Unicorn in Development

To use unicorn in development, simply add these gems to your Gemfile:

```
gem 'unicorn'

gem 'unicorn-rails', :groups => [:development, :test]
```

And then bundle install.  This will make the ```rails server``` command use unicorn in development instead of Thin.  Also, the default number of concurrent connections is set to 1 in development.  To boost it up a little higher for testing, add the following to your .env file:

```
UNICORN_WORKERS=2
```

### Unicorn in Production (Heroku)

For Heroku, Unicorn requires a Profile that describes how to run our web server.  In the root of your project, add a file, ```Procfile``` with this line:

```
web: bundle exec unicorn -p $PORT -E $RACK_ENV -c ./config/unicorn.rb
```

Next create the config file for ```config/unicorn.rb```

```
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true

before_fork do |server, worker|
  @sidekiq_pid ||= spawn("bundle exec sidekiq -c 2")

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
```

The important line that we added over the standard unicorn config is below:

```
 @sidekiq_pid ||= spawn("bundle exec sidekiq -c 2")
```
This tells unicorn to spawn a sidekiq task so that we can have sidekiq running alongside our app.

### Adding RedisToGo

Next go to your heroku account, click on the app you want to add Redis to.  Add the redis to go plugin.  Make sure you pick the free version of the plugin on the left.  You will also need to tell Heroku about your credit card info.  As long as you don't add anything that costs money to your app, you won't be charged.


## Email

### Email Basics

**Simple Mail Transfer Protocol (SMTP)** is an Internet standard for electronic mail (e-mail) transmission across Internet Protocol (IP) networks. 

An Internet email message consists of three components:

- the message envelope
- the message header
- and the message body

The **message envelope** is like the addresses on the outside of an envelope, which are used by mail transport software to route and deliver the email

The **message header** contains control information like an originator's email address and one or more recipient addresses. Usually descriptive information is also added, such as a subject header field and a message submission date/time stamp.

the **message body** contains the actual email text, like an HTTP body contains html.

Today's email systems are based on a store-and-forward model. Email servers accept, forward, deliver, and store messages. Neither the users nor their computers are required to be online simultaneously; they need connect only briefly, typically to a mail server, for as long as it takes to send or receive messages.

*Quick looks at diagram*

[http://www.howtogeek.com/56002/htg-explains-how-does-email-work](http://www.howtogeek.com/56002/htg-explains-how-does-email-work)


### Email in Rails With ActionMailer

Action Mailer allows you to send emails from your application using a mailer model and views. So, in Rails, emails are used by creating models that inherit from ActionMailer::Base that live alongside other models in app/models. Those models have associated views that appear alongside controller views in app/views.

Let's learn about action mailer by adding a mailer to the link checker app.  The goal is to email the user about the links once the action is complete.


#### Add Email Column to Site

To email a user, we need to keep track of who to email.  Add an email address to the site table.

```
rails g migration AddEmailToSite email:text
```

Then run the migration:

```
rake db:migrate
```

Next, add a field for email in the `app/views/sites/new.html.erb` view.

```
  <%= f.label :email %>
  <%= f.text_field :email %>
```


      
#### Generate ActionMailer

Now that we have a place to save the email, we can use the rails generator to create an action mailer class.

```
rails g mailer SiteMailer --no-test-framework
```

Check out what's been created.

**mailers/site_mailer.rb**
Mailers are very similar to Rails controllers. They also have methods called "actions" and use views to structure the content. Where a controller generates content like HTML to send back to the client, a Mailer creates a message to be delivered via email.

``` 
class SiteMailer < ActionMailer::Base
  default from: "from@example.com"
end
``` 
	
#### Create Email Template

Email templates are just like views! 

We need to create an email that reports on the status of the site that we are checking.  We are creating two versions, HTML and plain text. Why? Some email clients don't support HTML, they can render text only. The system sends both versions in the same email message (body), the email client decides which one to use. 

#### HTML version: views/site_mailer/status_email.html.erb

     <!DOCTYPE html>
     <html>
		<head>
  		  <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />
		</head>
		<body>
  		<h1>Status of the links on your site, <%= @site.url %></h1>
  		

      	<table>
        <tr>
          <th>Link</th><th>HTTP Response Code</th>
        </tr>

        <% if @links %>
          <% @links.each do |link| %>
            <tr>
              <td><%= link_to link.url %></td>
              <% if link.http_response >= 400 %>
                <td style="color:red">
              <% else %>
                <td style="color:green">
              <% end %>
              <%= link.http_response %></td>
            </tr>
          <% end %>
        <% end %>
        </table>

  		<p>Thank you for using the link checker!</p>
		</body>
    </html>

#### Text version: views/site_mailer/status_email.text.erb

    Status of the links on your site, <%= @site.url %>
    ===============================================

    Link                                   |  Http Response Code

    <% if @links %>
      <% @links.each do |link| %>
    <%= link.url %>   |    <%= link.http_response %>
      <% end %>
    <% end %>

    Thank you for using the link checker!

Notice that bot templates use the same instance variables. The content is the same, only the file type/presentation is different.

#### Implement Site Mailer

	class SiteMailer < ActionMailer::Base
      default from: ENV['EMAIL_FROM_ADDRESS']

	  def status_email(site)
        @site = site
        @links = site.links
        mail(to: @site.email, subject: 'Link Checker Status')
  	  end
    end
	
####Call SiteMailer

Send the status email after all the links have been checked.  Add the following line in `app/workers/links_worker.rb`

	SiteMailer.status_email(site).deliver	
      
      
###Configure mail gateway

Mail settings are configured in:

**config/environemnts/*.rb**

Below is an example of a real SMTP server config, i.e., Google:

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                 587,
      domain:               ENV['EMAIL_DOMAIN'],
      user_name:            ENV['EMAIL_USERNAME'],
      password:             ENV['EMAIL_PASSWORD'],
      authentication:       'plain',
      enable_starttls_auto: true
    }

#### Test Email in Rails Console

Everything should be working now.  Test it out in `rails c`.  Do the following:

```
site = Site.first
SiteMailer.status_email(site).deliver
```

Assuming you configuration is setup properly, you just sent an email!


#### Exercise

Now that we have emailing working, make the email operation a separate worker.  Call the worker from within the `LinksWorker` class.


## Resources

* [Redis Quick Start Guide](http://redis.io/topics/quickstart) - Ignore the installing Redis section
* [Redis Data Types](http://redis.io/topics/data-types)
* [Sidekiq RailsCast](http://railscasts.com/episodes/366-sidekiq)
* [Sidekiq Wiki](https://github.com/mperham/sidekiq/wiki)
* [Running Unicorn on Heroku](https://devcenter.heroku.com/articles/rails-unicorn)
* [Sidetiq](https://github.com/tobiassvn/sidetiq) - Useful for recurring dealyed jobs