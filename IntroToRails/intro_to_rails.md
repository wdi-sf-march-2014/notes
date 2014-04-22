#Introduction To Rails

##Objectives:
* Understand how to begin and navigate through a basic Rails project
* Demonstrate a diagram and explain how Model-View-Controller works in a Rails app
* Begin to describe typical workflow in a Rails project

##What Sinatra has helped us learn:

* Handling params in a request
* Routing a request
* Presenting a view with erb

##Major Principles:

a. What is Ruby on Rails? 
  - Rails is an MVC framework. MVC stands for Model-View-Controller, which is used in many different types of software development.

b. What is Model View Controller (MVC)?

    *Model* – data
      
  *View* – what the end users sees (HTML, generally with other embedded code). That is, they are the templates that render data to the user and all the logic surrounding presentational aspects of your app.
    
    *Controller* – traffic cop that manages the interactions between the models and the views). sits at the heart of everything, processing requests from clients, initiating changes in the models and triggering the rendering of the templates.
    
 c. What does the request-response lifecycle look like in RoR?

  - In Rails, the browser sends a message that goes to a router. From the router, it goes to the Controller. Usually what happens is that some data is needed, so the request goes to the Model, which is connected to a database. The data comes back into the Model, which passes it along to the Controller. Now the data needs to be formatted so it is presented, which is the job of the View. The View takes HTML, CSS, JavaScript, images, etc. and assembles them and sends it back to the Controller, which then sends it via the router to the user. 

 d. Other import principles of RoR:
    - Convention over configuration
    - ["Rails is omakase"  -DHH](http://david.heinemeierhansson.com/2012/rails-is-omakase.html)
    - DRY, Don't Repeat Yourself


##Code-Along
Let's create a new Rails project & cd into it:

```rails new blog```

Rails creates a bunch of directories and files for you and adds some gems and installs them. 

[Rails Directory Structure](http://i.imgur.com/whOL4DQ.png)

##Getting Acquainted with Rails

Let's navigate to the [Rails docs](http://api.rubyonrails.org/)

##Directory Structure
When you start to work on bigger projects, the architecture of the moving parts is essential. One popular web application design architectural patterns is referred to as Model-View-Controller (MVC). The MVC patterns seeks to separate components into Data Concerns, Presentation Concerns, and Request and Response (or Action) Concerns respectiveley:

- MVC directories
- 
| Component | Type of Concern |
| :--- | :--- |
| **M**odel | Data Concerns |
| **V**iew | Presentation Concerns |
| **C**ontrollers  | Request and Response (or Action) Concerns |

- Assets folder
  - Rails takes all of your stylesheets, javascript files, images and any other files you want, joins them together when possible, and places them in the public/assets folder.
  
  Rails applications default to having three possible asset locations:
  - *app/assets* is for assets that are owned by the application, such as custom images, JavaScript files or stylesheets.

  - *lib/assets* is for your own libraries’ code that doesn’t really fit into the scope of the application or those libraries which are shared across applications.

  - *vendor/assets* is for assets that are owned by outside entities, such as code for JavaScript plugins and CSS frameworks.
  
##Let's walk through a Gemfile
- [Example Gemfile](http://imgur.com/AJxVpsu)
- After you change your Gemfile, run bundle. Make sure to save the file first. The bundle (or bundle install)  command goes to find the gems in your Gemfile and install them. If you run bundle update, it will look for the most recent version of the gem and update them.
- Let's add the [better_errors gem](https://github.com/charliesome/better_errors)
  - You have to put any gem you want to use in your Gemfile. You have to run bundle anytime you change your Gemfile. Your rails server needs to be restarted after any changes to your Gemfile.

##Starting up Rails

Start Rails: 

- The rails server command launches a small web server named WEBrick which comes bundled with Ruby. 
- Port number=3000

  ```rails server or rails s```

Console:

- The console command lets you interact with your Rails application from the command line. On the underside, rails console uses IRB, so if you've ever used it, you'll be right at home. This is useful for testing out quick ideas with code and changing data server-side without touching the website. 

  ```rails console or rails c```


##What happens when your browser sends a request to Rails...

In Sinatra we had effectively one "controller", Rails will let us have many.

[Request-Response in Rails](http://imgur.com/N3UI7N9)
