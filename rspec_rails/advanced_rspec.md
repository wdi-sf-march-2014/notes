#Advanced Rspec

##Learning Objectives
- Define TDD
- Write 2 unit tests for Model
- Write 2 request specs
- Define factory
- Create/use 1 factory (with factory girl)
- Define stub
- Use 1 stub

###Code Along - User Email specs

```ruby

require 'spec_helper'

describe User do

  describe 'email' do

    it 'should have an email' do
      user = User.create(name: "jackie", password: "aaaaaa", password_confirmation: "aaaaaa")
      user.should_not be_valid
    end

    it 'should be in email format' do
      user = User.create(name: "jackie", email: "fake_email",password: "aaaaaa", password_confirmation: "aaaaaa")
      user.should_not be_valid
    end

    it 'should be unique' do
      user_1 = User.create(name: "jackie", email: "jackie@jackie.com",password: "aaaaaa", password_confirmation: "aaaaaa")
      user_2 = User.create(name: "jackie", email: "jackie@jackie.com",password: "aaaaaa", password_confirmation: "aaaaaa")
      user_2.should_not be_valid
    end
  end
end

```

###Exercise
____________

Add the following validation to your recipe model `validates :user, presence: true`.  

In `recipe_spec.rb` write a spec to ensure a recipe can be created when given valid attributes.  

In `recipe_spec.rb` write another spec to ensure your validation works.  

If you finish this, test the rest of your validations on user.  

###What is a factory?

A factory is a tool that allows us to create objects/data for our database to use for testing.  

*We use to do this with fixtures, but factories are better*  

###How to Install Factory Girl

**Add Factory Girl**  

Add factory girl inside of your development, test group in your gemfile.  

In *Gemfile*  

```ruby
group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end
```
In *Terminal*  

```
bundle install
```
Now when we create a model a `spec/factories` folder will be created for us, as well as coresponding factory files.  

FactoryGirl likes to create files that look like this...  

```
spec/factories/ingredients.rb
spec/factories/recipes.rb
spec/factories/users.rb
```

I find this format to be a waste of space, so I like to create one factories file called `factories.rb` and create all my factories in here.  

```
spec/factories.rb
```

###Code Along - Creating Some Factories

*factories.rb*

```ruby
FactoryGirl.define do

  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :recipe do
    name "Chicken"
    course "dinner"
    user
  end

  factory :user do
    name "name"
    email
    password "password"
    password_confirmation "password"
  end
end
```

**Associations:** When two models have an association we can create an object within another factory.  

Example:
```ruby
factory :recipe do
    name "Chicken"
    course "dinner"
    user
  end
```

**Sequences:** If you need uniqueness on a field, sequencing comes in handy. The sequences can then be used in your other definitions.  

Example:
```ruby
sequence :email do |n|
    "email#{n}@factory.com"
  end
```

###Code Along - Refactoring Recipe Spec

```ruby
require 'spec_helper'

describe Recipe do
  subject { FactoryGirl.create(:recipe) }

  it 'should be valid when given valid attributes' do
    subject.should be_valid
  end

  describe 'user' do

    it 'should have a user' do
      subject.user_id = nil
      subject.should_not be_valid
    end

  end

end

```

**Subject:** If you have several tests related to the same subject use subject{} to DRY them up. Subject blocks allow you to control the initialization of the subject under test. If you don’t have any custom initialization required, then you’re given a default `subject` method already. All it does is call `new` on the class you’re testing.  

**Let:** Use let to define a memoized helper method. The value will be cached
across multiple calls in the same example but not across examples.  
Note that let is lazy-evaluated: it is not evaluated until the first time
the method it defines is invoked. You can use let! to force the method's
invocation before each example.  

###Code Along - Edit Recipe Spec

*recipe_management_spec.rb*  

```ruby
require 'spec_helper'

describe 'Recipe Management' do
  let(:recipe) { FactoryGirl.create(:recipe) }
  let(:recipe_attributes) { FactoryGirl.attributes_for(:recipe, name: "Pork Chops") }

  before :each do
    ApplicationController.any_instance.stub(:current_user).and_return(recipe.user)
    ApplicationController.any_instance.stub(:signed_in_user).and_return(nil)
  end

  describe 'edit a recipe' do

    it 'updates recipe in database' do
      get "recipes/#{recipe.id}/edit"

      expect(response.status).to eq(200)
      expect(response).to render_template(:edit)
      expect(response.body).to include("Name", "Course")

      put "/recipes/#{recipe.id}", recipe: recipe_attributes

      expect(response).to redirect_to(recipe)
      follow_redirect!

      expect(response.body).to include("Pork Chops")
    end

  end

end

```

*factories.rb*  

```ruby
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email |n|
    "email#{n}@factory.com"
  end

  factory :user do
    name "Jackie"
    email
    password "password"
    password_confirmation "password"
  end

  factory :recipe do
    name "Chicken"
    course "dinner"
    user
  end
end

```

####Resources

- **Rspec Stubs:** https://www.relishapp.com/rspec/rspec-mocks/v/2-3/docs/method-stubs  

- **Rspec Stubs Examples:** http://old.rspec.info/documentation/mocks/stubs.html  

- **Factory Girl:** https://github.com/thoughtbot/factory_girl_rails  

- **Factory Girl Wiki:**  https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md  

- **Factory Girl Wiki:** https://github.com/thoughtbot/factory_girl/wiki/Usage  

- **Factories not Fixtures- Rails Cast:** http://railscasts.com/episodes/158-factories-not-fixtures  

- **Fixtures vs Factories:** https://semaphoreapp.com/blog/2014/01/14/rails-testing-antipatterns-fixtures-and-factories.html  

