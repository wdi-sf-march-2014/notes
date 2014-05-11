Lab: Finders and ActiveRecord::Relation
----------------------

#Objectives
* Add a Search Feature to your app
	* Add a search route (GET)
	* Add a search action to your controller
	* Add a SearchForm Form Object
		* validate user input, display errors and perform search
	* Update search action to use SearchForm
	* Reuse or refactor existing index view to display results
	* Add a link to your search page somewhere in your app
* **Optionally:** Add Pagination using the Kaminari gem
* **Optionally:** Use the Ransack gem to add an advanced search feature
* **Optionally:** Put your search functionality in it's own controller

#Procedure

Here's a starting point: Copy this file to app/models/simple_search.rb

```
class SimpleSearch
  include ActiveModel::Model

  #Generic Search 'q'
  attr_accessor :q
  validates_length_of :q, minimum: 2, message: 'Please enter at least 2 letters to search'

  # Add your other search params or validations here

  def persisted?
    false
  end

  def search_within scope, column_name
    #example where scope: only added when the q param is present
    unless self.q.blank?
      # SQL Injection protection example with LIKE operator
      # Which matches partial strings:
      scope = scope.where("#{column_name} ILIKE ('%' || ? || '%')", self.q)
    end
    #Add your own filters here
    scope
  end

  def self.get_params(params, as = :simple_search)
    params.require(as).permit(:q) if params.has_key? as
  end
end

```

Use it from one of your controllers with something like this:
```
  def search
    @search = SimpleSearch.new SimpleSearch.get_params(params)
    if @search.valid?
      @tracks = @search.search_within Track.all, :title
    end
  end
```

	
#Example Solution

I made a pull request on my project to implement this here:

* [https://github.com/stujo/moosiq/pull/9/files](https://github.com/stujo/moosiq/pull/9/files)

That has a lot of comments in it, I was trying to be helpful ;), but you may find the commit merge without comments helpful:

* [https://github.com/stujo/moosiq/commit/2be3d8c6f82a734513e3b8e86ccf24cab5d5b95f](https://github.com/stujo/moosiq/commit/2be3d8c6f82a734513e3b8e86ccf24cab5d5b95f)


#Resources

* Code Tips for adding Simple Search
	* [https://gist.github.com/stujo/3138e9b58af60d90814e](https://gist.github.com/stujo/3138e9b58af60d90814e)	

* Kaminari
	* [https://github.com/amatsuda/kaminari](https://github.com/amatsuda/	kaminari)
	
* Ransack
	* [https://github.com/activerecord-hackery/ransack](https://github.com/activerecord-hackery/ransack)
	





