# Single Page App With Rails

A single page app without a backend is fun to play around with, but if we want to persist some data, we'll have to get a database involved.  Rails can be used to create an api for our single page app and to store data from the app as well.

## Objectives

* Review creating APIs in rails
* Create a rails backend for a single page app
* Add ajax in the js code to get data from the rails backend

## API Review


Recall that we use `respond_to` to define how a json request should be responded to.  A simple example for a blog post index method in the post controller might be the following:

```
def index
  @posts = Post.all

  respond_to do |f|
    f.json { render :json => @posts, :only => [:id, :title, :author, :text]}
  end
end
```

When render is called for an object, `to_json` is called, which internally calls `as_json`.  Here are the `as_json` docs:

__[http://api.rubyonrails.org/classes/ActiveModel/Serializers/JSON.html#method-i-as_json](http://api.rubyonrails.org/classes/ActiveModel/Serializers/JSON.html#method-i-as_json)__

### Exercise

On any rails app you've worked on in the past, add responds_to in the controller and verify that the correct json is returned.  Play with some of the different options that `as_json` provides.  See if you can learn something new.  Lastly, take a look at this code in the adventures lab solution:

[https://github.com/wdi-sf-march-2014/adventure_library/blob/solution/app/models/adventure.rb](https://github.com/wdi-sf-march-2014/adventure_library/blob/solution/app/models/adventure.rb).

What is the as_json method doing?  Why is that cool?



## Creating Rails Backend

We will use a todo app to demonstrate a single page app with a rails server.  The first thing we need to do is get the rails app setup.

```
rails new SinglePageTodoApp --no-test-framework
```

```
rails g controller todos --no-test-framework --no-helper
mv app/assets/javascripts/todos.js.coffee app/assets/javascripts/todos.js
mv app/assets/stylesheets/todos.css.scss app/assets/stylesheets/todos.css
rails g model Todo text completed:boolean --no-test-framework
```

Next, lets modify the migration to give the completed column a default of false:

```
class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :text
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
```

```
rake db:create && rake db:migrate
```

One last step for the model.  Let's add a validation to make sure we don't create empty todo items:

```
class Todo < ActiveRecord::Base
  validates :text, presence: true, length: { minimum: 1 }
end
```



Now that our app has controllers and a model, let's set up the routes and views.  In app/assets/javascripts/todos.js, add the follow todo app js code:

```
$( document ).ready(function(){
  
  //add new todo
  $("#todo-form").on('submit', function(e) {
    e.preventDefault();
    var text = $('input').val();
    if(!text.length) {
      return;
    }
    else {
      addTodo(text);
      $('input').val("");
    }
  });
  
  $('ul').on('click', 'li', function(){
    var todo = $(this);
    if(todo.hasClass('completed')){
      todo.removeClass('completed');
    }
    else {
      todo.addClass('completed');
    }
    
  });
  
  $('ul').on('click', 'span', function(){
     $(this).parent().remove();
   });
  
  addTodo = function(todoItem) {
    var $newTodo = $('<li></li>');

    $newTodo.append(todoItem + '<span class="delete">Delete</span>');
    
    $newTodo.hide().appendTo('ul').fadeIn(500);
    console.log($newTodo);
  };
  
  $('#deleteAll').click(function(){
    $('li.completed').fadeOut(500, function(){
        $(this).remove();
      });
  });
  
  //create initial todos
  var seedTodos = ["Walk Dog", "Buy Milk", "Go Vegan"];
  $.each(seedTodos, function(index, item){
    addTodo(item);
  });
  
});
```

Next, add the css to `app/assets/stylesheets/todos.css`.

```
@import url(http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300);

* {
  font-family: 'Open Sans Condensed', sans-serif;
}
body {
  max-width:320px;
  margin:0 auto;
}
h1 {
  font-size:52px;
  font-weight:300;
  margin:10px 0 20px 0;
}
input {
  border:none;
  width:100%;
  font-size:22px;
  background:#eee;
  padding:8px 20px;
}
ul {
  margin:20px 0;
  padding:0;
}
ul li {
  width:100%;
  list-style-type: none;
  background:#ccc;
  color:#666;
  margin-bottom:1px;
  padding:8px 20px;
  font-size:22px;
}
.delete {
  float:right;
  cursor:pointer;
  color:#fff;
  font-size:22px;
}

.delete:hover{
  color:#FF6666;
}
.completed {
  text-decoration:line-through;
  color:#eee;
}
p#itemsLeft {
  padding:8px 20px;
}
#deleteAll{
  margin-left:10px;
  background:#FF6666;
  color:#662929;
  font-size:16px;
  border:none;
  padding:8px 20px;
  letter-spacing:2px;
  box-shadow:0 2px 0 0 #662929;
  border-radius:4px;
}
```

The last step is to add our html.  Let's create a view called main in `app/views/todo/main.html.erb`.  Next add the html for the app:

    <h1>Todo App</h1>

    <form id="todo-form">
      <input type="text" placeholder="what do you need to do?">
    </form>
  
    <ul></ul>
  
    <p id="itemsLeft"></p>
  
    <button id="deleteAll">Delete completed</button>
    
Finally, add a main method in the controller and create a route to it in `config/routes.rb`:

```
SinglePageTodoApp::Application.routes.draw do
  root "todos#main"
end
```


### Exercise

Add the code in your rails server for the index method.  The index method only needs to respond to json and return a list of todo items.  Each item should only return the id, text and completed.  Do not return created_at or updated_at.

Next make some seed todo data.  Run `rake db:seed` and verify that it is in the database using the console.

Add a route to your `config/routes.rb` file.  The route should be the standard RESTful route to get all the todos.

Finally, make a request to your app via the browser for your newly created json data.  (Note, I'm not saying to add the ajax request to your todo app yet.  Simple type the new route that you created into the browser location bar).  Verify that the json looks correct.

Verify that the json is __even more__ correct by writing a a few request specs.  The request spec should make a get to '/todos.json' and verify that the json returned looks correct.  It should also verify that updated_at and created_at do not get returned.  


![ajax](ajax.jpg)




### Reveiw

To create the index method, you should have made something similar to the following:

```
def index
  @todos = Todo.all
 
  respond_to do |f|
    f.json { render :json => @todos, :only => [:id, :text, :completed]}
  end
end
```

A RESTful route is also needed in the routes file:

```
get '/todos', to: 'todos#index'
```

To setup rspec, do:

```
rails generate rspec:install
mkdir spec/requests
touch spec/requests/todos_spec.rb
```

Your todos spec may look something like this:

```
require 'spec_helper'

describe '/todos' do

  before (:each) do
    @todos = Todo.create!([{text: "Walk dog"},
                           {text: "Update google docs for work", completed: true}])
  end

  describe 'GET with JSON' do
    before (:each) do
      get '/todos.json'
      @result = JSON.parse(response.body)
    end

    it 'returns all todo items' do
      @result.should_not be_nil
      @result.should have(2).todos
    end

    it 'should not have updated_at or created_at' do
      @result[0]['updated_at'].should be_nil
      @result[0]['created_at'].should be_nil

      @result[1]['updated_at'].should be_nil
      @result[1]['created_at'].should be_nil
    end

    it 'should have the correct data in the todos' do
      @result.find do |todo|
        todo["text"] == "Walk dog"
      end.should_not be_nil
    end
  end
end
```


## AJAX in a Single Page App

Now that we have a working backend and front end combination, we need the front end to get data from the backend.  Instead of using todo items that are hard coded into the javascript, let's create an ajax get request that gets the todo items on start.

First, what code in the javascript needs to change?

```
//create initial todos
var seedTodos = ["Walk Dog", "Buy Milk", "Go Vegan"];
$.each(seedTodos, function(index, item){
  addTodo(item);
});
```

That looks pretty hard coded to me.  Let's change it so that we use an AJAX get on page load instead.

### Exercise

Change the above code.  Instead of `var seedTodos`, create an empty array called `var todos`.  Then make an AJAX get request using jQuery.  When the request finishes successfully, call addTodo on each todo item.  There will be more data coming back than just the text.  Use the network tab to see what's going on, and remember how our json looks.  



![To do list](to-do-list.png)


### Review

The completed javascript should look similar to the following:

```

var count = 1000;

$( document ).ready(function(){
  
  //add new todo
  $("#todo-form").on('submit', function(e) {
    e.preventDefault();
    var text = $('input').val();
    if(!text.length) {
      return;
    }
    else {
      addTodo({text: text, completed: false});
      $('input').val("");
    }
  });
  
  $('ul').on('click', 'li', function(){
    var todo = $(this);
    if(todo.hasClass('completed')){
      todo.removeClass('completed');
    }
    else {
      todo.addClass('completed');
    }
    
  });
  
  $('ul').on('click', 'span', function(){
     $(this).parent().remove();
   });
  
  addTodo = function(todoItem) {
    if (!todoItem.id) {
      todoItem.id = count;
      count += 1;
    }
    var $newTodo = $('<li data-id="' + todoItem.id + '"></li>');

    if (todoItem.completed) {
      $newTodo.addClass("completed");
    }
    $newTodo.append(todoItem.text + '<span class="delete">Delete</span>');
    
    $newTodo.hide().appendTo('ul').fadeIn(500);
    console.log($newTodo);
  };
  
  $('#deleteAll').click(function(){
    $('li.completed').fadeOut(500, function(){
        $(this).remove();
      });
  });
  
  // Array of todos
  var todos = [];
  $.get('/todos.json').done(function(data) {
    todos = data
    $.each(todos, function(index, item){
      addTodo(item);
    });
  });
});
```

### Bonus Exercise

Add a json api for the show method in your controller.  Add a button to your todo item list that expands when it is clicked to reveal the creation date of the todo item.  Don't forget to test your show api!  Alternatively, you can return all of the created_at dates in your index method and keep track of them in your javascript code.

## Resources

* Interesting article about browser history and urls in a single page app: [http://danwebb.net/2011/5/28/it-is-about-the-hashbangs](http://danwebb.net/2011/5/28/it-is-about-the-hashbangs) 
* [Single page todo app](https://github.com/wdi-sf-march-2014/SinglePageTodoApp) with working ajax get request


