**Objectives:**
Now with checkboxes!
- [ ] Understand Nested Routes
- [ ] Implement Nested Routes
- [ ] Figure Out Nested Forms
- [ ] Implement forms with more than one model??!


Here's a simple [demo app](https://github.com/wdi-sf-march-2014/NestedExampleApp) which demonstrates the basics of **nested resources** and **nested forms**, using two simple models: Parent and Child.

Here's another [example app](https://github.com/wdi-sf-march-2014/NestedAuctionApp).  It's a really really terrible auction website.  It uses 2 models: Auction and Bid.

##Nested Resources

Nested resources allow us to build out URL structure between two related models, and still maintain a RESTful convention.

It's common to have resources that are logically children of other resources. For example, suppose your application includes these models:

```ruby
class Magazine < ActiveRecord::Base
  has_many :ads
end

class Ad < ActiveRecord::Base
  belongs_to :magazine
end
```

Nested routes allow us to capture this association between the two models.  In our `routes.rb` file, we could add:

```ruby
resources :magazines do
  resources :ads
end
```

The resulting routes look something like this:

![Screen Shot 2014-05-12 at 8.01.46 PM.png](https://draftin.com:443/images/15047?token=vsc-fjd0kcprAUpmuTddwH5EkT18m3LJFi3eEg0m8pnmyIgtAQiB_EItqtJttyTufonbuqEZ11hggEwYazfQOec)

For more information, read the Rails Guide, [Rails Routing from the Inside Out](http://guides.rubyonrails.org/routing.html)

##Simple Nested Routes and Forms Example

The following code snippets are taken from [this example app](https://github.com/wdi-sf-march-2014/NestedExampleApp).  **I've chosen to only highlight the new/important parts of the code.**  Check out the github repo for the rest. :)

Suppose we have 2 models, Parent and Child.  Each of the models have a name (string) attribute.  The Child model also has a parent_id (integer) attribute  The model associations are as follows:

```ruby
class Parent < ActiveRecord::Base
  has_many :children
end

class Child < ActiveRecord::Base
  belongs_to :parent
end
```
To set up our nested routes, we add the following to our `routes.rb` file:

```ruby
resources :parents do
  resources :children
end
```

Now we'll have routes like `parents/4/children` and `parents/2/children/3/edit` set up for us.

Our Parent controller is straightforward.  It is no different from any of the other simple controllers we've written before.

Things start to change a little bit in the `children_controller.rb`.  Remember that our routes look like `parents/:parent_id/children`, where each child belongs to a specific parent. In each method, we first look up the correct Parent using `params[:parent_id]` before we do anything with Child.


```ruby
class ChildrenController < ApplicationController

  def index
    @parent= Parent.find(params[:parent_id])
    @children = @parent.children.all
  end


  def show
    @parent = Parent.find(params[:parent_id])
    @child = @parent.children.find(params[:id])
  end

  def new
    @parent = Parent.find(params[:parent_id])
    @child = @parent.children.new
  end

  def edit
    @parent = Parent.find(params[:parent_id])
    @child = @parent.children.find(params[:id])
  end

  def create
    @parent = Parent.find(params[:parent_id])
    @child = @parent.children.new(child_params)

      if @child.save
        redirect_to [@parent, @child], notice: 'Child was successfully created.'
      else
        render action: 'new'
      end
  end


  def update
    @parent = Parent.find(params[:parent_id])
    @child = @parent.children.find(params[:id])
      if @child.update(child_params)
        redirect_to [@parent, @child], notice: 'Child was successfully updated.'
      else
       render action: 'edit'
      end
  end


  def destroy
    @parent = Parent.find(params[:parent_id])
    @child = @parent.children.find(params[:id])
    @child.destroy
    redirect_to parent_children_path(@parent)
  end

  private
    def child_params
      params.require(:child).permit(:name)
    end
end
```

The views for `index` and `show` are self-explanatory.   However, the `new` and `edit` forms look slightly different that what we're used to.

```ruby
<%= form_for([@parent, @child]) do |f| %>
  <%= f.label :name %><br>
  <%= f.text_field :name %>
  <%= f.submit %>
<% end %>
```

Notice that the form requires 2 models, a Parent and a Child.  That's really the only difference.  Remember that in this case we're not creating/editing a Parent; we're only creating/editing a Child, which belongs to a Parent.

## How do we handle multiple models in one form?!

Let's suppose that we want to create a Parent and a Child at the same time.  We can accomplish this using **Active Record Nested Attributes**  Nested attributes allow you to save attributes on associated records through the parent.

Read more about Nested Attributes on [Rails Docs](http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html).  Do it!

The first thing we need to do is add the following to our Parent model:

```ruby
class Parent < ActiveRecord::Base
  has_many :children
  accepts_nested_attributes_for :children
end
```

Our new method in the `parents_controller.rb` is no different than normal:

```ruby
def new
  @parent = Parent.new
end
```
Our `new.html.erb` for Parent is a little different than what we've seen before. It looks like this:

```ruby
<%= form_for @parent do |f| %>
  <%= f.text_field :name, placeholder: "Name of Parent" %>
  <%= f.fields_for :children, @parent.children.build do |b| %>
    <%= b.text_field :name, placeholder: "Child's Name" %>
  <% end %>
  <%= f.submit %>
<% end %>
```

Lastly, we need to update our create method in our parents controller:

```ruby
def create
  @parent = Parent.create(params[:parent].permit(:name, :children_attributes=>[:name]))
  if @parent.save
    redirect_to @parent, notice: 'Parent was successfully created.'
  else
    render action: 'new'
  end
end
```


