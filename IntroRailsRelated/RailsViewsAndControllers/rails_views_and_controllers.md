# Rails Views and Controllers Lesson
* <h2>Today we are going to review a completed rails app: Todo App.</h2>
* <h2> Todo App is a complete implementation of a CRUD.</h2>
* <h2> The morning we will review the Todo App in detail. </h2>
* <h2> The afternoon lesson will be a code along to create the Todo App. </h2>
  
## We will analyze the todo_app in detail

* <h3> We will follow how the Views and the Controller communicate together. </h3>
  * <h3> We will follow a  typical rails code development sequence. </h3>
  
* <h3> We will learn some Rails commands used in the view </h3>
  * <h3> form_for, link_to, button_to </h3> 
* <h3> Our focus will be on Views and Controllers. Of course we will need to have routes. </h3>
* <h3> The database model code is stubbed out for us. We will leave the detailed discussion of the database creation and commands for tomorrows lesson. </h3>

# Learning Objectives
<h3> At the end of the lesson, you should be able to: </h3>
* <h3> 1) Set up restful routes.  </h3>
* <h3> 2) Set up a controller to interact with index, show, new, and edit pages. </h3>
* <h3> 3) Know what to implement on each view page (index, show, new, and edit). </h3>
*  <h3> 4) How to setup and use a form_for, button_to and link_to rails commands. </h3>
*  <h3> 5) How to set up Bootstrap in a rails app. </h3>


# Get the completed todo_app. Clone it to your desktop.

###[Todo App](https://github.com/spencereldred/rails_todo_app/tree/master)

## Action: Run bundle install.
## Action: Prepare the database
  # migrate the database
  bundle exec rake db:migrate
  
  # seed the database
  bundle exec rake db:seed

## Action: Go to your terminal and start the server.
  # start the server
  rails s

## We begin the review! 

## Rails helper commands:

### [form_for](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html)

### [link_to](http://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-link_to)

### [button_to](http://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-button_to)

###[Todo App Walkthrough](https://draftin.com/documents/308676?token=LxTYR3f8GqIFo6JCYXCiM0aVZIW8Et0QLUtf-_Kl879kZNBolZyW7Ibg_XlweJXt_E4HsxBXu0HuIy7xGtD08FM)

