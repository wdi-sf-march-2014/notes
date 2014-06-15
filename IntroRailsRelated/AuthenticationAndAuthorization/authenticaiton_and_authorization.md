# Authentication And Authorization

## Objectives

* What is the difference between authentication and authorization
* What is a cookie?  What does the browser do to keep it safe?
* Describe how a password is securely stored in an authenticated application
* Describe how an authorization system could be built in an application
* Go over steps for configuring a secure rails app


## Authentication vs Authorization

__Authentication is not authorization!__  

Authentication: the act of verifying that a user is who he claims to be.  For example, when the user enters his password and the system verifies that the password is correct, the user has been authenticated.

Authorization: the act of verifying that a user who has already been authenticated also has access to a certain resource.  For example, if user A is logged  in to an email application, user A should only be allowed to read his emails, and should not be allowed to read user B's emails.


## Cookies!
![Cookie Monster](cookie_monster.jpg "Cookie Monster")

A cookie is just a key and value that your browser stores.  The browser ensures that any cookie stored for www.mydomain.com is only seen for that url and nothing else.  For example, www.hackersite.com should not be able to send any request in order to get my cookie information.

HTTP is a stateless protocol. A cookie is a way of storing some state on the client side for future requests.  For the purposes of authentication, the cookie will store a token that we help the user log into the site without having to up in his password every time.

### Exercise

Go to your favorite major website (Google, Facebook, Amazon, etc).  Open up developer tools and look at the `Resources` tab.  Pay attention to the domain column, the expires column, and the secure column.  What do those fields do?  How do they modify the cookie?   

## HTTP vs HTTPS

HTTP is unencrypted traffic.  HTTPS (minus any [major security bugs](http://blog.existentialize.com/diagnosis-of-the-openssl-heartbleed-bug.html)) is a secure connection between the client and the server.  So any data that is sent of http cannot be considered secure.  HTTPS is required to ensure secure transfer of data on the web.

### Exercise

Read the rails guide on [session hijacking](http://guides.rubyonrails.org/security.html#session-hijacking).  Discuss with your neighbors and the class afterwards.

## Cookbook App With Auth

The code for the cookbook application is available [here](https://github.com/wdi-sf-march-2014/cook_book_with_authentication_and_authorization).  Fork and clone the app if you'd like to have your own version to follow along with.


__Follow the create user path__: Look at the ```app/controllers/users_controller.rb``` file.  Follow the flow of creating a new user.   What is happening?  Notice how the password is securely stored in the database.


__Follow the create session path__:  Next, look at the ```app/controllers/sessions_controller.rb```.  How does the user sign in once he has created an account?  What verifies that the user's password is correct?  What happens when the user puts in an invalid password?

### Exercise (Research)

Go check out the [has_secure_password docs](http://apidock.com/rails/ActiveModel/SecurePassword/ClassMethods/has_secure_password).  What features does the has_secure_password method add to our model?  What has to be done in order for has_secure_password to work?

### Exercise (Coding)

Fork and clone the [cookbook app](https://github.com/wdi-sf-march-2014/cook_book_with_authentication_and_authorization).  Write a second before filter on the ingredients controller.  The filter should not allow any modifying action to be preformed on an ingredient unless the current user owns that ingredient.

## Setup Steps For A Secure Application

There are a few steps that must be followed in order for your secure application to actually be secure.

__Step 1__: Ensure that the ```config/initializers/secret_token.rb``` does not have any secret strings in it.  This is used to generate a signed cookie.  If the secret is checked into github, your application could easily be compromised.  Instead, your secret_token.rb file should contain something like the following:

```
CookBook::Application.config.secret_token = ENV['SECRET_KEY_BASE']
```

__NOTE__: In the latest version of rails, the file to edit might be called ```config/initializers/secrets.yml```.  This file is typically already using a ENV hash.

__Step 2__: Add the ```dotenv-rails``` gem to the ```Gemfile```.  The change should look something like this:

```
group :development, :test do
  gem 'dotenv-rails'
end
```

More information on the gem is available on the [dot env github page](https://github.com/bkeepers/dotenv).

__Step 3__: __IMPORTANT__ your 	```.gitignore``` file must ignore the file  that will be created on the next step.  __DO NOT CHECK IN A .ENV FILE TO GITHUB!!__  The following line should be added to the ```.gitignore``` file and committed to github:

```
.env
```

__Step 4__: Add a ```.env``` file in the root of the project.  The file contains keys and values.  The keys will be accessible in the ENV hash of rails.  We want the SECRET_KEY_BASE to have a long secret key associated with it.  To generate the secret key, run ```rake secret```.  The ```.env``` file should look something like the follwing:

```
SECRET_KEY_BASE=91599e3db059958b939385e5eb1dd0199e3f94b47ae8b4c1ced283472f0e0f31a5ba1f99bbdc79fd8c9a1f2c1495f181b025f7d3eb39e65c72044500e4f047aa
```

To generate the file and the secret string all in one shot, use the follwing command while your current directory is the project's root directory:

```
echo "SECRET_KEY_BASE=`rake secret`" > .env
```

__Step 5__: Force the app to use SSL in production.  In ```config/environments/production.rb```, make sure the following is present:

```
config.force_ssl = true
```


### Exercise

Using any existing rails app, follow the above steps to ensure that it is secure.  Use the instructions above and the [cookbook app](https://github.com/wdi-sf-march-2014/cook_book_with_authentication_and_authorization) as a reference.

## Resources

* [Rails Security Guide](http://guides.rubyonrails.org/security.html)
* [Devise: an authentication gem](https://github.com/plataformatec/devise)
* [Cookbook app with authentication and authorization](https://github.com/wdi-sf-march-2014/cook_book_with_authentication_and_authorization)
* [Michael Hartl's Book on Rails - Chapters 5 to 9](http://www.railstutorial.org/book)
* [has_secure_password docs](http://apidock.com/rails/ActiveModel/SecurePassword/ClassMethods/has_secure_password)
* [Heartblead Bug in OpenSSL](http://blog.existentialize.com/diagnosis-of-the-openssl-heartbleed-bug.html)
* [Dotenv](https://github.com/bkeepers/dotenv)