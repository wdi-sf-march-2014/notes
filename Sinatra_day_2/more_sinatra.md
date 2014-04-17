# More Sinatra

##Quick Review

1. What is a route? 
2. What is a parameter?



| objectives  |
| :---      |
| Students can serve a page with embeded ruby |
| Students can create forms and receive data from clients |
|   Student can create layouts for their views |  

## Views

Right now, we are serving a `"Hello, World!"` string to the client. However, this is the web and content sent to clients is usually HTML. 

Let's create a folder for these HTML files called `views`.

Next, create an index.html file as follows.

`./views/index.html`

    <h1> Hello, World </h1>

and change our app

`./app.rb` 

    require 'sinatra'

      get '/' do
          send_file "views/index.html"
      end
    
Check out what send_file does in the docs! [send_file](http://www.sinatrarb.com/intro.html#Sending%20Files)
 
However, this is a completely static file that we are serving, which would require a lot work if we wanted to change the message being displayed.

### erb saves the day

- Erb (embedded Ruby) is a templating system that embeds Ruby into a text document. In this case, it embeds Ruby code in an HTML document.
- Erb allows Ruby code to be embedded within a pair of <% %> delimiters. The code is then evaluated in-place (they are replaced by the result of their evaluation).

Rename your `index.html` to `index.erb` and make the following changes: 


`./views/index.erb`

    <h1> <%= @greeting %>, World! </h1>

Now, change your app.rb

`./app.rb`

    require 'sinatra'

      get '/' do
          @greeting = "Hello"
          erb :index
      end

- Note, erb: index is rendering the views/index.erb

- Feel free to put most of your Ruby in these tags. However, if you  want to put a variable into these tags that was set in your *routing method* then it needs to be an instance variable, i.e. it needs the `@` prefix. See `@greeting` above. 

- If you wanted have commented out Ruby code in erb, this would be the syntax: <%# ruby code %>

----
###A bad example of erb tag usage:

`./views/index.erb`

    <h1> <%= greeting %>, World! </h1>


with the following

`./app.rb`

    require 'sinatra'

      get '/' do
          greeting = "Hello"
          erb :index
      end


would cause an error.

----

Similarly, there are another pair of erb tags,  `<% ... %>`. These erb tags simply evaluate an expression in the tags and use the value returned to change the layout of your html.

Next, change your app.rb

`./app.rb`

    require 'sinatra'

      get '/' do
          @show_greeting = true
          @greeting = "Hello"
          erb :index
      end


`./views/index.erb`

    <% if @show_greeting %>
      <h1> <%= @greeting %>, World!</h1>
  <% else %>
    <h2> Welcome... </h2>
  <% end %>

-----

### Layouts

A view called layout.erb with a yield will automatically wrap our views

    `<!-- views/layout.erb -->
    <html>
      <head>
        <title><%= @page_title || 'Untitled' %>
      </head>
      <body>
        <%= yield %>
      </body>
    </html>`


-----
### Stylesheets and all that

Why are layouts useful? There are elements of that get carried over from one html page to another. Most importantly there are resources like stylesheets that need to be included with every page The layout makes including this simple.


We need a general folder to put all our scripts, stylesheets, and images. The folder to hold all these items is called the `public` folder. Create a folder in `./public` for stylesheets `/stylesheets` and then create a stylesheet called `style.css`


`./public/stylesheets/style.css`

    .container
    {
      width: 50%;
      margin-left: auto;
      margin-right: auto;
      border: solid 1px black;
    }

and to include this in our layout we add the following to our head.

    <link rel="stylesheet" type="text/css" href="/stylesheets/style.css">

-----
### Forms

At some point we need to get content back from a user. To do this we use an html form with an appropriate `action` and `method`.

> **action**: defines the *route* where the form *submission* request will be sent to server.

and 
> **method**: defines the *type* of request that will be sent on *submission* of the form

Putting these to use we get the following simple form.

    <form action="/animals" method="post">
        <input type="text" name="animal[:species]">
        <textarea name="animal[:description]"></textarea>
        <button> save </button>
    </form>
    
The note here is that the form will now send the fields of the form to our application and will be accessed in the `params` using the `:animal` key.

>  params[:animal] => {:species => "dragon", :description => "coool" }


Think of the above form as a form with fields for an `animal` and the name of each field is a key whose value is input by the client. 

A reusable form for creation or editing

    <!-- You'll need to make sure these variables are set correctly -->
    <form method="<%= @form_method %>" action="<%= @form_action %>">
        <input type="text" name="whatever"></input>
        <!-- more inputs -->
        <input type="submit">Done</input>
    </form>


-----

### IN-CLASS EXERCISE: Make a calculator in Sinatra

* `GET /add/1/1`
* `GET /subtract/5/1`
* `GET /multiply/3/11`
* `GET /divide/2/1` - Do not crash on divide by zero!
* Bonus challenge: (use Sinatra docs!)
    * `GET /multiply/1/1.1` - Support floats
    * `GET /add/1/2/3` - Allow an arbitrary number of operands
    
-----
### Redirect
 
After a request is made it is often important to make a redirect. You can trigger a browser redirect with the redirect helper method.
A good example is when someone makes a POST request. Or, for example, let's say that you wanted to redirect everyone who visited the root of your web app (/) to an /index page. 

    post "/animals" do 
  
      animal = params[:animal]
      # save the animal somehow
    
      redirect "/animals"
      end

-----
    
###If you want another practice exercise:
Create a simple web application that manages a TODO list.  The web application should respond to the following routes:

  http://localhost:4567/                    - display the TODO list
  http://localhost:4567/add/wash+the+dog    - adds "wash the dog" as a TODO list item (spaces need to be escaped as plus signs in URLs)
  http://localhost:4567/remove/wash+the+dog - removes "wash the dog" as a TODO list item

Code to help you get started:
  require 'sinatra'
  
  # Store the TODO list in an array
  items = []
  
  get '/' do
    # To iterate through an array, use the #each method 
    # Note that "puts" in Sinatra will only output to the console, not the web
    # browser.  Instead, build up a string called "response" and return it to
    # Sinatra so that will be the response
  
    response = ""
    items.each do |item|
      # TODO: Build up the response string by concatenating "item" and a line
      # break "<br/>" to the string
    end
  
    # Keep the line here so that response is returned to sinatra
    response
  end
  
  get '/add/:item' do
    # The new item will be available as params[:item]
    # TODO: Insert code to add params[:item] to the global items array here
  
    redirect to('/')
  end
  
  get '/remove/:item' do
    # The item to be removed will be available as params[:item]
    # TODO: Insert code to remove params[:item] from the global items array
    # here.  You may want to use a method called Array#delete (look it up in the
    # documentation!)
  
    redirect to('/')
  end


### RESTful Routing - To Explore on Your Own
    
    ```ruby <!--things.rb  -->

    require 'sinatra'
    require 'sinatra/reloader'
    
    get '/things' do
        # Show a list (index) of things
    end
    
    get '/things/:id' do
        # Show thing  using it's :id
    end

    post '/things' do
        # Create a new thing
    end
     ```
Now with views:
    ```ruby <!--things.rb  -->

    require 'sinatra'
    require 'sinatra/reloader'
    
    get '/animals' do
      @animals = # get all animals from DB
        erb :index
    end
    
    get '/animals/:id' do
       id = params[:id]
       @animal = # find an animal using it's id
       
       erb :show
    end

    post '/animals' do
      animal = params[:animal]
      #save animal and give it `some_id`
      
      redirect "/animals/#{some_id}"
    end
     ```