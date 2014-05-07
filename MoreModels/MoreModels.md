#Draft Do Not Use!



Topic: finders joins and callbacks

More Models: ActiveRecord Queries
==================

![Bay Moon](http://clients.stujophoto.com/photos/i-T95QPqj/4/L/i-T95QPqj-L.jpg)

[_Bay Moon_](http://clients.stujophoto.com/)


#Objectives
* Use `.where` and `.find`
* Understand Query Chaining and why it works
* Dynamic Finders
* Check for record existance
* find_or_create
* Ordering Model Results with `.order`
	* Default `order`
* Grouping Model Results with `.group`
* Defining `scope`s
	* Default `scope` 
* Understand and use Eager Loading
* Run `EXPLAIN`

#Overview
* Use your personal project models to try things out
* `.rails c`
* `.Album.where`
* The console will display the actual SQL being run
* puts Gem.loaded_specs["rails"].version


#.find
Returns a single result (or nil)

```
Agent.find(1)
SELECT  "agents".* FROM "agents"  WHERE "agents"."id" = ? LIMIT 1  [["id", 1]]
```

```
 Agent.find(1).class
```


#.all
```
Agent.all
SELECT "agents".* FROM "agents"
```

#.where
* `.where` Which records to select:

```
Agent.where(first_name: 'Bob')
SELECT "agents".* FROM "agents"  WHERE "agents"."first_name" = 'Bob'
```
```
Agent.where(last_name: 'Williams')
SELECT "agents".* FROM "agents"  WHERE "agents"."last_name" = 'Williams'
```

##not

```
Agent.where.not(last_name: 'Williams')
SELECT "agents".* FROM "agents"  WHERE ("agents"."last_name" != 'Williams')
```

##order 

```
Agent.where(first_name: 'Bob').order(:last_name)

SELECT "agents".* FROM "agents"  WHERE "agents"."first_name" = 'Bob'  ORDER BY "agents"."last_name" ASC

```

```
Agent.where(first_name: 'Bob').order(last_name: :desc)

SELECT "agents".* FROM "agents"  WHERE "agents"."first_name" = 'Bob'  ORDER BY "agents"."last_name" DESC

```

##limit

```
Agent.all.limit(2)
SELECT  "agents".* FROM "agents"  LIMIT 2
```


#Scopes

[http://guides.rubyonrails.org/active_record_querying.html#scopes](http://guides.rubyonrails.org/active_record_querying.html#scopes)


**TODO!**

#Query Chaining

```
Agent.where(first_name: 'Bob').where(last_name: 'Williams')
SELECT "agents".* FROM "agents"  WHERE "agents"."first_name" = 'Bob' AND "agents"."last_name" = 'Williams'
```

#ActiveRecord::Relation
```
Agent.where(first_name: 'Bob').class
 => Agent::ActiveRecord_Relation
```

#Other Query Methods
##Single Object Finders:
* `.take`

```
Agent.take
SELECT  "agents".* FROM "agents"  LIMIT 1
```

* `.first`

```
Agent.first
SELECT  "agents".* FROM "agents"   ORDER BY "agents"."id" ASC LIMIT 1

```

* `.last`

```
Agent.last
SELECT  "agents".* FROM "agents"   ORDER BY "agents"."id" DESC LIMIT 1
```
	
## ActiveRecord::Relation

* `.group` - SQL `GROUP` used with `.count`

```
Track.group(:band_id).count
```

```
releases = Track.select("count(id) as total_releases, band_id").group(:band_id)
pp releases.map(){ |item| {band_id: item.band_id, total_releases: item.total_releases} }

SELECT count(id) as total_releases, band_id FROM "tracks"  GROUP BY band_id


 => [{:band_id=>1, :total_releases=>4}, {:band_id=>2, :total_releases=>2}, {:band_id=>3, :total_releases=>1}, {:band_id=>4, :total_releases=>1}] 


```

* `.joins`

```
Agent.joins(:bands)` -> `INNER JOIN`

SELECT "agents".* FROM "agents" INNER JOIN "bands" ON "bands"."agent_id" = "agents"."id"

```

* `.limit`

```
Agent.limit(2)` -> `LIMIT 2
```

* `.offset` -> `LIMIT -1 OFFSET 3`

```
Agent.offset(3)
```

* `.order`

```
Agent.order(:first_name)
```


```
Agent.all.order(first_name: :desc)
```

* `.includes` - Automated pre-loading: -> `LEFT OUTER JOIN`
* [http://guides.rubyonrails.org/active_record_querying.html#eager-loading-associations](http://guides.rubyonrails.org/active_record_querying.html#eager-loading-associations)

```
Agent.includes(:bands)
```

* `.readonly` - Prevent unplanned changes to model

```
Agent.readonly.first.update_attributes(phone_number: "(415)-556-6666")
```

* `.select` - Like SQL `SELECT`

```
Agent.select(:first_name, :last_name)
```

* `.uniq` - Some joins like HABTM can return multiple copies of the same record

```
Band.all.includes(:albums).first.albums.map(&:title)
	=> ["Stars", "Stars", "Silent Movie Soundtrack", "Silent Movie Soundtrack"]
```


```
Band.all.includes(:albums).first.albums.uniq.map(&:title)
	=> ["Stars", "Silent Movie Soundtrack"] 
```

#Where Bonus

##Range Queries

```
Agent.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
```


	
#Query Methods - Extras
* `..find`, `.first` and `.last` with 'limit'
* `..find_each` and `.find_in_batches`
* `.create_with`
* `.distinct` - Only unique records alias for `uniq`
* `.extending` - Add new scope methods to relation
* `.from(other_relation)` - Table or other scope
* `.having`
	* `.Track.group(:band_id).having('count(*) >= 2').count`
* `.preload` - Pre-loads with second query: 
	* `.Agent.preload(:bands)`
* `.eager_load` - Pre-loads with join
	* `.Agent.eager_load(:bands)` -> `LEFT OUTER JOIN`
* `.lock` - `SELECT ... FOR UPDATE` - Record locking is a complex topic
* `.none` - Empty relation, no query - allows all code paths to return 'something'
* `.references`
	* ~~`Agent.includes(:bands).where('bands.name = "The Beafles"')`~~
	* `.Agent.includes(:bands).where('bands.name = "The Beafles"').references(:bands)`
* `.reorder` - Re-Do ordering
* `.reverse_order` - Actually self-explainatory 
* `.rewhere` - Redefine named condition
	* `.Agent.where(first_name: 'Bob').rewhere(first_name: 'John')`
	* `.SELECT "agents".* FROM "agents"  WHERE "agents"."first_name" = 'John'`
* `.select (with block)` - Filters the results like Array.select
	* Agent.select{|m| m.first_name == 'John'}
* `where` with placeholders:

```
Agent.where("created_at >= :start_date AND created_at <= :end_date",
  {start_date: params[:start_date], end_date: params[:end_date]})
```  	


#Resources
* [http://guides.rubyonrails.org/active_record_querying.html](http://guides.rubyonrails.org/active_record_querying.html)
* [http://api.rubyonrails.org/classes/ActiveRecord/QueryMethods.html](http://api.rubyonrails.org/classes/ActiveRecord/QueryMethods.html)