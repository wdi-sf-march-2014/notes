#Rspec in Rails

###Learning Objectives
- install rspec in rails app with documentation
- create unit tests for methods in model
- define TDD

###Rspec Review
__________________

**Quick Exercise**  

Write rspec tests for this method.  
Try to test each case.  

```ruby
def calculator(num1, num2, operator)
  case operator
    when "+"
      num1 + num2
    when "-"
      num1 - num2
    when "/"
      num1 / num2
    when "*"
      num1 * num2
  end
end
```

**What does `describe` do?**  

RSpec gives you a way to encapsulate what you’re testing via the describe block.  
The describe method creates an example group.  

**What does `context` do?**  

Within the block passed to describe you can declare nested groups using 
the describe or context methods.  

**What does `it` do?**  

You can declare specific examples (i.e. a single unit test) using the it method.  

**What does `should` do?**  

We use `shoudld` to set-up an expectation for our test.  

`should` is just a method that we call on an object, and that takes in a matcher as an argument.  `should` then tests the object in relation to our matcher.  

###Rspec - Rails Installation
_____________________________

**Step 1:**  

Add rspec rails to your Gemfile in the development, test group and bundle install  


*Gemfile*  
```ruby
group :development, :test do
  gem 'rspec-rails'
end
```

*Terminal*  
`bundle install`  

**Step 2:**  

Create spec directory, and necessary configurations  

*Terminal*  
`rails generate rspec:install`  

This adds `spec/spec_helper.rb` and `.rspec` files that are used for configuration. See those files for more information.  

**Step 3:**  

Create a spec file for our model.  
This is only necessary if you had a model created before you installed rspec.  

*Terminal*  
`rails generate rspec:model todo`  

**Step 4:**  

Setup your test database.  

Your test database is separate from both your development, and production databases.  

*Terminal*  
`rake db:test:prepare`  

**Step 5:**  

Run your rspec tests (they should all pass as you don't have any)  

*Terminal*  
`rspec` or `bundle exec rspec`

To run specific specs

```
# Run only model specs
bundle exec rspec spec/models

# Run only specs for AccountsController
bundle exec rspec spec/controllers/accounts_controller_spec.rb
```

###Code Along 
______________

*todo_spec.rb*
```ruby

it "should create a new instance given valid attributes" do

end

describe 'title' do
  it 'should not be empty' do
    todo = Todo.create(description: "my description")
    todo.should_not be_valid
    todo.errors[:title].should include("can't be blank")
  end
end

describe 'recent' do
  before do
    @todo1 = Todo.create(title: "my title",description: "my description")
    @todo2 = Todo.create(title: "my title",description: "my description")
    @todo3 = Todo.create(title: "my title",description: "my description", 
      created_at: (Date.today - 3.days), updated_at: (Date.today - 3.days))
  end

  it 'should return todos that have been updated today' do
    Todo.recent.should eq [@todo1, @todo2]
  end

end

```

###Exercise
__________________

**1.** Write a spec to ensure that a todo with valid parameters can be created

**2.** Write a spec to ensure that a todo has a description

###Code Along
________________

*todo_spec.rb*  
```ruby
  describe 'alphabetize' do

    before do
      @todo1 = Todo.create(title: "a title",description: "my description")
      @todo2 = Todo.create(title: "b title",description: "my description")
      @todo3 = Todo.create(title: "c title",description: "my description")
    end

    it 'should return an array of todos alphbatized by title' do
      Todo.alphabetize.should eq [@todo1, @todo2, @todo3]
    end
  end
```

*todo.rb*  
```ruby
  def self.alphabetize
    Todo.order(:title)
  end
```

###Exercise
_________________

*This should be done in pairs*  

**1.** Write a spec for a method called 'outdated'. This method should return todos that are over a month old  

**2.** Write code to make this method pass  

###Code Along
_______________

*spec/requests/todo_management_spec.rb*

```ruby
describe "Todos Management" do 

  describe 'creating a new todo' do

    it 'renders form and creates a new todo' do
      get "/todos/new"
      expect(response).to render_template(:new)

      post "/todos", :todo => {:title => "My Todo", description: "Do Things"}

      expect(response).to redirect_to(assigns(:todo))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include("Do Things")
    end

  end
end
```

###Exercise
______________

**1.** Write a request spec for displaying a list of todos when one goes to the root path  

###Resources
__________________

**Rspec-Rails Documentation:** https://github.com/rspec/rspec-rails  
**Model Specs:** https://www.relishapp.com/rspec/rspec-rails/docs/model-specs  
**Request Specs:** https://www.relishapp.com/rspec/rspec-rails/docs/request-specs/request-spec  
