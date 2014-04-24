# Rails Models

## Objectives
* Describe what Active Record does, how it relates to a database
* Get data from the database using Active Record and model methods
* Use migrations to alter your database
* Create model validations to validate input

## Active Record and ORM

__ORM__ stands for object relational mapping. ORM describes a software system that maps SQL queries and results into objects.  __Active Record__ is an example of an ORM system that is used commonly in rails.  What is an example of an Active Record object?   If you have a model called Todo, defined below:

```
class Todo < ActiveRecord::Base
end
```

Todo is a class that inherits from ```ActiveRecord::Base```.  Todo defines a model in rails.  Todo is an object that models the data in the ```todos``` database.  The ```Todo``` class has methods that allow the user of the class to query the data in todos.  For example, ```Todo.all``` is a method call on the ```ActiveRecord``` object that issues a SQL query to the database that looks like this: ```SELECT "todos".* FROM "todos"```.  The object that is returned from ```Todo.all``` is a ```ActiveRecord::Relation``` object.  It is similar to an array of ```Todo``` objects.

## Active Record Methods

Active Record gives us access to loads of tools that help write SQL statements for us.  To test that out, we'll use a todo app as a sandbox.  

### Setting up the Todo App

Use this [todo app repo](https://github.com/wdi-sf-march-2014/rails_todo_app).  Go to a new directory and do the following:

```
git clone https://github.com/wdi-sf-march-2014/rails_todo_app.git
git fetch origin
git checkout -b model_e1 origin/model_e1
git checkout -b model_e2 origin/model_e2
git checkout -b model_e3 origin/model_e3
git checkout -b model_e4 origin/model_e4
git checkout -b model_e5 origin/model_e5
git checkout -b model_solution origin/model_solution
git checkout model_e1
```

Now you should be on a branch called model_e1.  The lesson will use this branch for some exercises.  Please make sure you're on the correct branch by typing ```git branch``` to see the branch you're on.  Another way to check is to type ```git status```.  The status message tells you the branch you're working on as well.  To switch to a branch to work on an, like exercise 3, just checkout the corresponding branch:  ```git checkout model_e3```.  Note, this may not work if you have local changes.

One last thing, if you ever mess up your code and you want to __REVERT ALL CHANGES__ back to a clean working state, do the following command: ```git checkout -- .```  Don't forget that last period!  This command takes your repo back to the last commit.

### Active Record all, find, find_by, where, count, first, take

All of the methods listed help you retrieve data from the database and then get back ActiveRecord objects.  The methods ```all``` and ```find``` are used frequently in rails examples.  Here is an example of ```find_by``` using the todo app mentioned above:

```
# Finds the first item that matches the query
Todo.find_by(title: "Wash the Car")
```

If we want to get a set of data that matches a query, we can specify the ```where``` clause in the SQL statement.

```
Todo.where('created_at < ?', Date.today )
```

To get the number of items in a result set, use ```count```:

```
Todo.where('created_at < ?', Date.today ).count
```

#### Exercise 1

Search around for the difference between ```first``` and ```take```.  In rails console, find the record in the database with the smallest id whose date created was before today.  


### Active Record save, update, destroy, reload

An object is only modified in the database when you issue a SQL command.  For example, if I do the following:

```
todo = Todo.find_by(title: "Wash the Car")
todo.title = "Don't wash the car"
todo.description = "I'm too lazy to wash the car today"
```

Nothing has changed in the database.  This is a common error that people make.  If you make changes to an ActiveRecord object, make sure the changes get saved or updated in the database.  See what happens when you take the same todo object and call ```todo.reload```.

You'll notice that the data we put in the todo object was lost.  To save the data do something similar to the following:

```
todo = Todo.find_by(title: "Wash the Car")
todo.title = "Don't wash the car"
todo.description = "I'm too lazy to wash the car today"
todo.save
```
Or

```
todo = Todo.find_by(title: "Wash the Car")
todo.update(title: "Don't wash the car", description: "I'm too lazy to wash the car today")
```

Notice the SQL statements that get executed.  The log shows you what is happening.

Now do ```todo.reload```, notice that your data has been saved.

#### Exercise 2

I want to add a new feature to the todo app.  I want something basically identical to the index view, except I only want to see todo items on it that I've modified today.  The idea is to show recent todo items in that list.  Take a look at the code to see the changes that are already there.  Next, get the app to show only recent todo items when the user goes to the ```/recent``` route.

### Skinny Controllers, Fat Models

Some of you may have written code in the controller to figure out the previous exercise.  For example, the following code in the controller gets the job done:

```
# DOES NOT TAKE ADVANTAGE OF THE DATABASE
@todos = Todo.all.select {|row| row.updated_at > Date.today }
```

We get all the todos from the database, then do a select statement to only keep the todo items that were modified today.  The problem with this code is that we are doing too much data manipulation in the controller.  The database is very good at operating on data, and we should try to use SQL as much as possible.

__BEST PRACTICE:__ Instead of putting logic into the contoller, let's add it to the model.  This code takes advantage of the database's ability to quickly find data.  In ```app/models/todo.rb```.  Add the following:

```
def self.all_todos_modified_after(date)
  Todo.where("updated_at > ?", [date])
end
```

This is a class method of the Todo class.  The method does a query in the database that only returns the todo items that were updated after the passed in date.  Now in the controller, all we have to do is add the following code:

```
def recent
  # Prefered way of getting recent todos.  Use the database!
  @todos = Todo.all_todos_modified_after(Date.today)
end
```



## Migrations

A migration keeps track of all the changes you've made in the database.  It allows developers to collaborate on the database without passing around SQL scripts.  It's also very useful when you push your site to production since you don't want to make changes to your production database until you're confident in the changes you've made.  But you also want a way to repoduce the changes reliably.  That is what a migration is for.  Take a look at the ```db/migrate``` folder.  In it, you'll find the first migration that was used to create the todos table.  Notice the line, ```t.timestamps```. That is Active Record's way of adding the ```created_at``` and ```updated_at``` columns to the database.

#### Exercise 3

We want to add a new feature to the app to keep track of when a todo item is done.  In order to do that, we'll need to create a migration to alter the database.  Do the following, ```rails g migration AddDoneToTodos done:boolean```.  Take a look at the resulting migration code in the db/migrate directory.  Try to understand what it's doing.  Let's modify the migration slightly to give the column done a default value.  Change the line in the migration file to look like the following:

    add_column :todos, :done, :boolean, default: false
    
Next, apply the migration to your database.  Run the following command:

```
rake db:migrate
````
    
#### Exercise 4
Now that we have our new column, we need to create a migration that populates the data in the done field of the database. In the previous exercise, we set a default value for done, but if you look at ```Todo.all``` in the rails console, all the records that were already there have a value of nil for done.  Create another migration like this:

```
rails g migration AddDoneDataToTodos
```

Take a look at the migration that was generated this time.  Notice that there is no code inside the change method.  That's what we need to add.  Write some code that sets all todo item done fields to false.

__HINT__:  The method ```change``` is the same as any method in rails.  It has access to active record objects.  If I wanted to make an migration that just set the first todo item's done field to false, I might write it like this:

```
class AddDoneDataToTodos < ActiveRecord::Migration
  def change
    todo = Todo.first
    todo.done = false
    todo.save
  end
end
```
Once you get the migration working, don't forget to do ```rake db:migrate```.

## Validation

One other great feature of models is validation.  Very often you need to have some validation on your data.  For example, in our todo app, we may want to validate that the title and the description are present.  We could also validate the length of the input using max and min.  Here is a simple validation on the todo model (File located here: ```app/models/todo.rb```):

```
class Todo < ActiveRecord::Base
  # Validating the title is present 
  validates :title, presence: true
  
  def self.all_todos_modified_after(date)
    Todo.where("updated_at > ?", [date])
  end
end
```

If we want to add some validation to the title, we could also add a size range:

```
class Todo < ActiveRecord::Base
  # Validating the title is present and the length of the title is between 2 and 200
  validates :title, presence: true, length: {minimum: 2, maximum: 200}
  
  def self.all_todos_modified_after(date)
    Todo.where("updated_at > ?", [date])
  end
end
```

Finally, you can add validations to other fields as well.  Let's add a validation just to check that description is present:

```
class Todo < ActiveRecord::Base
  # Validating the title is present and the length of the title is between 2 and 200
  validates :title, presence: true, length: {minimum: 2, maximum: 200}
  # Validating that there is some description.
  validates :description, presence: true
  
  def self.all_todos_modified_after(date)
    Todo.where("updated_at > ?", [date])
  end
end
```

#### Exercise 5
Go to rails console.  Now try to create an empty todo item by doing the following:

```
todo = Todo.create()
```

Take a look at the contents of todo.  Notice that is has no values.  Try calling the ```persisted?``` method on todo.  What does ```persisted?``` do?

Next, do the following:

```
todo = Todo.first
todo.title = ""
todo.save
```

Notice what save does to the database and what save returns.  Instead of ```save```, try the follwing method:

```
todo = Todo.first
todo.title = ""
todo.save!
```

What is the difference between ```save``` and ```save!```?


## Resources
* [ActiveRecord Query Interface](http://guides.rubyonrails.org/active_record_querying.html)
* [ActiveRecord Validations](http://guides.rubyonrails.org/active_record_validations.html)
* [PSA: Fat Controllers Video](https://www.youtube.com/watch?v=91C7ax0UAAc)
