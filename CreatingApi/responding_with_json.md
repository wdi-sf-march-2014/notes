#Responding with JSON

## Rails Format JSON

In our Rails controller lesson, we introduced the idea of responding to different __formats__ with different code.  A user or client of our applicaiton might access our resource and want our response in one of a variety of different formats.  The two main formats we will use are HTML for browsers which want to render a web page, and JSON for browsers or any other client type which wants just data.

```ruby
def index
  @movies = Movie.all
  respond_to do |format|
    format.html
    format.xml { render xml: @movies.to_xml }
    format.json { render json: @movies, status: :ok }
  end
end
```

```ruby
response = Typhoeus.get('localhost:3000/movies?format=json')
```
With the above code we can call our own API and receive json data.  

Each method on the object passed to the respond_to block corresponds to a format.  The json block is called for a request which ends in ".json" and so on.  In this way, we can specify a block for each kind of response.  If there are queries that we only need to do for HTML responses, we can do it in the format.html response.  If there are queries we only need to for JSON responses, we can do them in the block.  

#### To_JSON in detail

Rails's `render :json => <object_to_render>` functionality calls `to_json` on whatever you pass to it, and that calls `as_json`.  `as_json` takes a variety of options which can be used to bring in associations, include or exclude fields and more.  

[http://api.rubyonrails.org/classes/ActiveModel/Serializers/JSON.html#method-i-as_json](http://api.rubyonrails.org/classes/ActiveModel/Serializers/JSON.html#method-i-as_json)

###Refactoring

In the case of our index method, specifying different outputs for html and json is actually unnecessary. If the API request specifies the format as json, rails will automatically return json.  

*Note: this only works with json, not xml*  

```ruby
def index
  @movies = Movie.all
```

```ruby
response = Typhoeus.get('localhost:3000/movies.json')
```

###Defaulting to JSON

Sometimes when creating an API, we only want it to respond with json, and never with html. One way we can do this is by putting our `respond_to` at the top of our controller.  

```ruby
respond_to :json

def index
  @movies = Movie.all
  respond_with(@movies, status: :ok)
end
```
      
## Responding to JSON posts

**First Way**  
```ruby
def create
  respond_to do |format|
    if @movie.save
      format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
      format.json { render action: 'show', status: :created, location: @movie }
    else
      format.html { render action: 'new' }
      format.json { render json: @movie.errors, status: :unprocessable_entity }
    end
  end
end
```

It doesn't make sense to respond to a successful JSON POST to a create endpoint with a redirect.  Instead, you should respond with a 2xx and whatever information the client might need, like the id of the created record.  Here is an example of one acceptable response code scheme for successful requests.

| RESTful request | HTML response code | JSON response code |
|:---------------:|:------------------:|:------------------:|
| index           | 200                | 200                |
| new             | 200                | 404                |
| create          | 302                | 201 (200 is OK)    |
| show            | 200                | 200                |
| edit            | 200                | 404                |
| update          | 302                | 200                |
| delete          | 302                | 200                |

The new and edit actions are for showing forms, which don't exist for clients other than browsers.  Responses on errors will be different also.  An attempt to __show__ a non-existent record might give a 404 to a json client and redirect an html client to a search page.  A good JSON endpoint will return an error in a JSON format.  

To make decisions about this, read the documentation of various JSON apis and commentary comparing them.  Here are some examples:  

  * https://dev.twitter.com/docs/error-codes-responses
  * https://blog.apigee.com/detail/restful_api_design_what_about_errors
  * http://docs.aws.amazon.com/AmazonSimpleDB/latest/DeveloperGuide/APIError.html
  
As you use APIs and decide which ones you like working with, and which ones you despise, you'll develop opinions about how APIs should be designed.  

## CSRF protection with JSON POSTS

**CSRF Token:** A token to prevent cross-site request forgery.  

The default `exception` policy of responding to requests prevents a JSON post to an endpoint without a CSRF token.  Since the main reason for CSRF protection is to prevent session hijacking, we can change the policy in `ApplicationController` to `null_session`.  That means we process requests without CSRF tokens as if there was no session cookie in the request.  

```
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  protect_from_forgery with: :null_session
end
```

## Rescue from and specifying your errors

When you write an API, you are writing an interface for other programmers to use.  Your errors should be sensible.  When you use strong parameters to specify permitted parameters, if a parameter is missing, it raises an ActionController::ParameterMissing exception.  For a JSON request, we should render a JSON response:

```
  rescue_from ActionController::ParameterMissing, :only => :create do |err|
    respond_to do |f|
      f.html do 
        redirect_to new_site_path
      end
      f.json {render :json  => {:error => err.message}, :status => 422}
    end
  end
```
  
##Extra Resources

- **Status Codes:** http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html  
- **Rescue:** http://kevinthompson.info/blog/2013/07/14/customizing-the-strong-parameters-missing-parameter-response.html  

- **Rails Cast - Securing an API:** http://railscasts.com/episodes/352-securing-an-api?view=asciicast  
