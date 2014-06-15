**Objectives:**

* Understand AJAX Posts
* Use Ajax to add items to your DB without refreshing

Remember from yesterday that AJAX allows for asynchronous requests in the browser. In other words, http requests can be made to the back end server, without reloading the page. AJAX us the ability to create more interactive and responsive pages which result in a better user experience.

We're going to make another single page todo app, but this time it will have a rails backend. This means that our todos will persist!

Our app will have a new todo form at the top of the page, and it will list all of the todos in the database below.  It should look like this:

![Screen Shot 2014-05-20 at 2.44.10 PM.png](https://draftin.com:443/images/15329?token=rWUPPyf7Pkr2g8LV2oMEMecqcS9bb3wP2B5-EhEHrFuDqqZ2lwXgRjjA_Mtc_FTXN-vyJ-sf7gTGLxDYkKo8Kyw)

So let's start by setting up our basic rails app.  Generate the model:

`rails g model Todo`

Each Todo will have a title and description.  Add the following columns to your migration:

```ruby
  def change
    create_table :todos do |t|
      t.string :title
      t.string :description
      t.timestamps
    end
  end
```

`rails g controller todos`

`resources :todos`

We're going to use the `new` view as our app's main page where the form and list of todos will be.  It will be like a combination of an index page and a new page. We need to pass in 2 things in our method: a variable with all the todos and another variable with an empty Todo for the form.

```ruby
class TodosController < ApplicationController

  def new
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to new_todo_path
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :description)
  end
end
```

We also set up our standard `create`and `todo_params` methods.

Next, we need to create our `new.html.erb` view and add in our form and loop through all the todos:

```ht
<h1>New Todo</h1>

<%= form_for(@todo) do |f| %>
  <%= f.label :title %><br />
  <%= f.text_field :title %>
  <br>

  <%= f.label :description %><br />
  <%= f.text_field :description %>

  <%= f.submit %>
<% end %>

<h1>All The Todos</h1>
<ul>
  <% @todos.each do |todo| %>
    <li><b><%=todo.title%></b> - <%= todo.description %></li>
  <% end %>
</ul>
```

Our app now works!  We can create new todos and they will show up in the list at the bottom of the page.  However, this isn't a true single page app.  The browser is refreshing every time the form is submitted.  **AJAX to the rescue!**

##Implementing AJAX

In order for AJAX to work, we first need to respond with JSON in our create method.

The create method should now look like this:

```ruby
 def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.json { render json: @todo, status: :created}
      else
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

```

What that says is, "if the client wants JSON, return them the newly created Todo in JSON format." (Rails determines the desired response format from the HTTP Accept header submitted by the client.)

For more information about Rails status codes, read [this rails guide](http://guides.rubyonrails.org/layouts_and_rendering.html#using-render).  You have to scroll down a bit to the section on status codes.

Here's part of a chart that shows status codes and their corresponding rails symbol:

![Screen Shot 2014-05-20 at 3.08.25 PM.png](https://draftin.com:443/images/15332?token=gKFIwtdNGj7kjQuOkVA-vP5i0cL-qVbKtKcsPzgOLQzn7GSgoYfC_zHyFpBG9YbNcYA6re4q4o02KuXkX_ALd6Q)

So, now that we have our create method responding with JSON, let's add some javascript!


Add the following code to `application.js`

```js
$(document).ready(function(){
  $('#new_todo').on('submit', function(event){
    event.preventDefault();
    var form = $(this);
    var title = $('#todo_title').val();
    var description = $('#todo_description').val();

    $.ajax({
      url: form.attr('action'),
      method: form.attr('method'),
      data: {
        "todo": {
          "title": title,
          "description": description
        }
      },
      dataType: "json",
      success: function(data) {
        console.log(data);
        var ul = $('ul')
        var todo =  "<li><b>"+data.title+"</b> - " +data.description + "</li>";
        ul.append(todo);
        $(':text').val('');
      },
      error: function(){
        alert("Server is broken!");
      }
    });
  });
});
```

We could also have used [jquery.post method](http://api.jquery.com/jquery.post/), which is a shorthand version of the regular jquery.ajax function with POST as its

Here's a link to the completed [todo app](https://github.com/wdi-sf-march-2014/AjaxTodoRails)




