#Introduction To Rails

#Objectives:


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

Now

##Directory Structure
- MVC directories
- Environment file
- Assests folder
- Gemfile + Bundle

##Start & stop Rails
- Port numbers
- Console
- Generate models & controllers: generators

##Exercise:
- Create 10 controllers
- Ignore 9 controllers
- Create a controller with actions