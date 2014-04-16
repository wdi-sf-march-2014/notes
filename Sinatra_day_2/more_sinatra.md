# More Sinatra

## Views

Right now, we are serving a `"Hello, World!"` string to the client. However, this is the web and content sent to clients is usually HTML. Lets create a folder for these HTML files called `views`.


Let's create an index.html file as follows.

`./views/index.html`

  <h1> Hello, World </h1>

and change our app

`./app.rb`

  require 'sinatra'
  require 'sinatra/reloader'

    get '/' do
        send_file "views/index.html"
    end
    
 
 However, this is a completely static file that we are serving, which would require a lot work to change if wanted to change the message being displayed.
 

### erb saves the day

Rename your `index.html` to `index.erb` and make the following changes 

`./views/index.erb`

  <h1> <%= @greeting %>, World! </h1>


Also, change your app.rb

`./app.rb`

  require 'sinatra'
  require 'sinatra/reloader'

    get '/' do
        @greeting = "Hello"
        erb :index
    end


Note, `<%= ... %>` are erb tags that render the return value of anything evaluated in them. Feel free to put most of your ruby in these tags. However if you  want to put a variable into these tags that was set in your *routing method* then it needs to be an instance variable, i.e. it needs the `@` prefix. See `@greeting` above. 

----
As bad a example of erb tag usage see the following

`./views/index.erb`

  <h1> <%= greeting %>, World! </h1>


with the following

`./app.rb`

  require 'sinatra'
  require 'sinatra/reloader'

    get '/' do
        greeting = "Hello"
        erb :index
    end


would cause an error.

----

Similarly, there are another pair of erb tags,  `<% ... %>`. These erb tags simply evaluate an expression in the tags and use the value returned to change the layout of your html.

Also, change your app.rb

`./app.rb`

  require 'sinatra'
  require 'sinatra/reloader'

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
### Redirect
 
After a request is made it is often important to make a redirect. A good example is when someone makes a post request. 

  post "/animals" do 
    
    animal = params[:animal]
    # save the animal somehow
    
    redirect "/animals"
  end



-----
### Restful Routing
    
    ```ruby <!--things.rb  -->

    require 'sinatra'
    require 'sinatra/reload'
    
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
    require 'sinatra/reload'
    
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