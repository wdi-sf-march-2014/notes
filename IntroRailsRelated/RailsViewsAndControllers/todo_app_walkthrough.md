**The following notes are only intended as a guide to the basic rails workflow and syntax.  These notes do not explain WHY we do things the way we do.**

`rails new todo_app`

`cd` into the newly created todo_app folder

`rails s` and navigate to http://localhost:3000/

You should see the default landing page!
***

So now, let's work on creating the todo model.

We want each todo entry to have 2 things: a **title** and **description**

To generate our model, type: `rails g model Todo title:string description:string`  **model names must be singular!**

To apply our changes to the database,we must type:

```
rake db:migrate
```


Now let's add some starter data to our database.  We will add our starter data to the `db/seeds.rb` file.  Add this to the seeds.rb file:


```
todos = Todo.create([
  {title: "Buy Groceries", description: "Go to Safeway, don't forget the coupons."},

  {title: "Wash the Car", description: "Have a date this Saturday."},

  {title: "Clean my room", description: "It's that time of year again."},

  {title: "Do the Laundry", description: "Don't forget the bleach!"},

  {title: "Work on Mini-Project", description: "What are Happy Tails anyway?"},

  {title: "Walk the Dog", description: "Take Fido around the block."}

   ])

```

In order to actually create the Todos that we added to the seeds.rb file, we must run

```
rake db:seed
```

Now that we have some todos in our database, let's get them to show up somewhere in our browser!

***

#Part 2: Our First Route/Index/Page

We are going to start by getting a simple welcome page to show up when we go to http://localhost:3000/

In the `config/routes.rb` file, add this line:

```
root 'todos#index'
```

That line is telling rails that when we visit the root page(http://localhost:3000/), it should call the index method inside of the todos controller.

So we need to do 2 things: **create the todos controller** AND **add the index method** inside of it.

Let's start by creating our todos controller.   Type this in your terminal:

```
rails g controller todos
```

This will create a new controller for us.  You can find it at `app/controllers/todos_controller.rb`.  Inside the new controller we need to add the index method we're calling in the routes.  Add this:

```
def index
end
```

For now, we can leave it as an empty method.  The last thing we need to do is add our index view.  Rails will automatically render the view with the same name as a controller method.  So we need to create a new called `index.html.erb` inside of `app/views/todos`

Add this to the view we just created:

```
<h1> Index Page! </h1>
```

Now if we start our server up using `rails s`, we should see our new view showing up.  Woo!

***

Now let's work on getting our todos to show up on our index view.  Just like in Sinatra, we can share data between our controllers and views using instance variables.

In the index method in the todos controller, we're going to create a new instance variable which will hold all of the todos in our database.  Our method should look like this:


```
def index
  @todos = Todo.all
end

```

So now in our `index.html.erb`, we have access to the @todos variable. We're going to loop through and create a list element for each todo in @todos.  Add this to our `index.html.erb`:

```
<% @todos.each do |todo| %>
    <li><%=todo.title%></li>
<% end %>
```

Now if we refresh our web browser, we should see a list with all of our todos. Hooray!

***

#More Routes!

Open up your terminal and type

```
rake routes
```

This command lets us see all the routes currently set up in our app.  Right now it looks like this:

![](https://draftin.com:443/images/14314?token=nR2pEMdjOEOfS-QvarohpcRUjGMutnegxSEoG8uWknY7T5e4RdD-RjA-RDw7tBt3UGlX2pSKIGeKwzRuOrz0Lt0)

We currently only have an index route set up.  We are going to want to set up all of our restful routes:

* Index
* Show
* New
* Create
* Edit
* Update
* Destroy

We will go over all of them in detail, but for now just know that we want to set up these 7 routes.  We can do this easily by adding this to our `routes.rb` file:

```
resources :todos
```

That one small line does a lot of stuff for us.  Try running ``rake routes`` again and you should see this:

![](https://draftin.com:443/images/14315?token=kN-rzj2r5bLJn-dOx56moBjpGyB1NFru9FikU2q0r-IboTLGMRHQ47hANZU7AECLuM47_ccvU0ncquEk_2h-ME0)


#On To The Show Page

Next we're going to implement a show page for our todos.  A show page will include detailed information about one specific todo.   If you look at the route for our show page, it looks like this: `/todos/:id`. To access the show page for the 5th plane in our database, we would go to this url: http://localhost:3000/todos/5

Just like with the index route, we need to create the show method in our todos controller.  Add this below your index method:

```
def show
end
```

Since the show page is where we show specific information about one todo, we need to lookup the correct todo using the `id` parameter provided in the url.  We want to grab the id from the url, use it to find the correct todo entry in our database, and then save it to an instance variable that we can use in our show view.

We do this by adding the following code to our show method:

```
def show
 @todo = Todo.find(params[:id])
end
```

Just like with our index method, we need to set up a show view.  Create the file `show.html.erb` in the `views/todos` folder.

This is where we'll put the code to display the title and description of each todo.  Add this to the show view:

```
<h1>Todo Show Page</h1>
<p>Title: <%= @todo['title']%></p>
<p>Description: <%= @todo['description']%></p>

<%= link_to "Back To Todo List",todos_path%>
```

Now if we point our browser to http://localhost:3000/todos/2 we will see details about the 2nd todo in our database.

The last thing we want to do is set up a link for each todo's show page back on our `index.html.erb`.  We do this by using a ruby `link_to` tag inside of our each loop.  Our loop should look like this now:

```
<% @todos.each do |todo| %>
    <li> <%= link_to todo.title, todo_path(todo.id) %></li>
<% end %>
```

So now our index page has a link to each todo's show page!  The syntax for the `link_to` tag is: `link_to LINK TEXT, LINK PATH`.  Because our show route requires an id in the url , we pass in each todo's id in the link_to.

***

#Making new todos - New and Create!

In order for our todo list to be useful at all, we need to be able to create new todos.  You may have noticed that we have 2 routes that sounds like they would help us here: **new** and **create**

We use the new method to render the form and the create method actually creates the new todo using the form data.  Let's start by getting the form to show up.  We need to add a new method to our `todos_controller.rb`.

```
def new
end
```

We're going to use rails' special form_for helper to help create our form.  In order for the form_for to work, we need to pass it an "empty" model.  We want this form to help make a new Todo, so we pass in an empty todo from our controller.  You new method should now look like this:

```
def new
  @todo = Todo.new
end
```

Next, we need to actually create our `new.html.erb` file in `views/todos`.  In our newly created file we need to add our form_for.  It looks like this:

```
<h1>Create a New Todo</h1>
<%= form_for @todo do |f| %>

  <%= label_tag(:title, "Title:") %>
  <%= f.text_field :title %></br>

  <%= label_tag(:description, "Description") %>
  <%= f.text_area :description %></br>
  <%= f.submit "Create" %>
<% end %>
```

The syntax takes a little bit to get used to.  This form creates labels and inputs for title and description, and it adds a submit button.  When we hit submit, it posts this information to the **create** method.

We need to make our create method in our `todos_controller.rb`

```
def create
end
```

In the create method we need to use the form data to create a new Todo.

```
def create
 @todo = Todo.create todo_params
end
```

The above code won't work until we define what todo_params is.  At the bottom of our `todos_controller.rb` (but still before the last end) we need to create the private todo_params method:

```
private
    def todo_params
      params.require(:todo).permit(:title, :description)
    end
```

All this method does is return the title and description from the form on `new.html.erb`.

The very last thing we want to do is redirect to the newly created todo's show page at the end of the create method.  Our create method should now look like this:

```
def create
    @todo = Todo.create todo_params
    redirect_to todo_path(@todo)
end
```

It's not very convenient to have to type http://localhost:3000/todos/new into our browser.  Let's add a link to the new page at the top of our **`index.html.erb`**

```
<%= link_to "New Todo Item", new_todo_path %>
```

***

#Edit And Update

The Edit and Update methods are very similar to New and Create.  Just like **New** renders a form and **Create** adds to the DB, **Edit** also renders a form and **Update** alters the DB.

We need to make our edit method in the `todos_controller.rb`.

```
def edit
end
```

Instead of passing an "empty" Todo to our form helper, we want to look up the specific Todo that we're going to edit.  If we visit http://localhost:3000/todos/10/edit, we want to edit the todo with an ID of 10.  Add this to our edit method:

```
def edit
  @todo = Todo.find(params[:id])
end
```

Next, we want to create our `edit.html.erb` view in `views/todos`.  We can reuse the same form from the new view.  Add this:

```
<h1>Edit Your Todo</h1>
<%= form_for @todo do |f| %>

  <%= label_tag(:title, "Title:") %>
  <%= f.text_field :title %></br>

  <%= label_tag(:description, "Description") %>
  <%= f.text_area :description %></br>

  <%= f.submit "Update" %>
<% end %>
```

The Edit form is going to post to the Update method.  So we need to create that method in our `todos_controller.rb`

```
def update
end
```

In the Update method, we need to do 3 things.  First, we need to look up the specific Todo that is being edited.  Then we actually update that Todo using the form data.  Finally, we redirect back to the Todo's show page. Our Update method should look like this:

```
def update
    @todo = Todo.find(params[:id])
    @todo.update todo_params
    redirect_to todo_path(@todo)
end
```

Notice that we're using the same`todo_params` method in both the Create and Update methods.

Let's add a link to the Edit path for every todo on the index page.  Our `index.html.erb` should look like this now:

```
<h1> Index Page! </h1>

<%= link_to "New Todo Item", new_todo_path %>

<% @todos.each do |todo| %>
    <li>
      <%= link_to todo.title, todo_path(todo.id) %>
      <%= link_to "edit", edit_todo_path(todo[:id]) %>
    </li>
<% end %>


```

***

#DESTROY DESTROY DESTROY!

The last thing we need to implement is our Destroy method.  So let's start by creating the Destroy method in our `todos_controller.rb`

```
def destroy
end
```

In our Destroy method we want to do 2 things.  First we want to delete the correct Todo, and then we want to redirect back to the Index.  Add this to the Destroy method:

```
def destroy
    Todo.find(params[:id]).destroy
    redirect_to root_path
end
```

Now we just need to add our delete links on the `index.html.erb` view.  It should look like this:

```
<h1> Index Page! </h1>

<%= link_to "New Todo Item", new_todo_path %>

<% @todos.each do |todo| %>
    <li>
      <%= link_to todo.title, todo_path(todo.id) %>
      <%= link_to "edit", edit_todo_path(todo[:id]) %>
      <%= link_to "delete", todo, method: :delete, data: { confirm: "You sure?" }%>
    </li>
<% end %>


```

#Andddd We're done!












