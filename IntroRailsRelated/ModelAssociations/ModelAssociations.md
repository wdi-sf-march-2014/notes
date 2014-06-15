Intro to Model Associations
==================

![Relationships](http://clients.stujophoto.com/photos/i-DGskW2W/0/L/i-DGskW2W-L.jpg)
[_Relationships_](http://clients.stujophoto.com/)


#Objectives
* Review using Postgres as your Database for Rails Apps
* Understand these ActiveRecord model associations
	* belongs_to
	* has_many
	* has_many, through: 
* Recognize these model associations
	* has_one
	* has_one   through:
	* has_and_belongs_to_many
	
#Introduction

You're back in the Music business! Following your success on your first gig, you're linked in recommendations have led you to a new job at MooSIQ!

**MooSIQ : Cows love music too**

Contgratulations!

[REVIEW THE ERD WORKSHOP](EntityRelationshipDiagrams.md)


#Rails Database Review

My preferences for creating new apps are to put the following in my `~/.railsrc` file:

    -d postgresql -T

This causes rails new to default to using postgresql 

The `/moosiq/config/database.yml` will look something like this:

```

development:
  adapter: postgresql
  encoding: unicode
  database: moosiq_development
  pool: 5
  username: moosiq
  password:
  #port: 5432

test:
  adapter: postgresql
  encoding: unicode
  database: moosiq_test
  pool: 5
  username: moosiq
  password:

production:
  adapter: postgresql
  encoding: unicode
  database: moosiq_production
  pool: 5
  username: moosiq
  password:


```
At this point there is still no database created

```
rake db:create
FATAL:  role "moosiq" does not exist
/Users/stuart/.rvm/gems/ruby-2.1.0/gems/activerecord-4.0.4/lib/active_record/connection_adapters/postgresql_adapter.rb:848:in `initialize'

```

Reports and error because user `moosiq` does not exist, and neither do any of the databases that it's referring to :(

For local development I'll at least need `moosiq_test` and `moosiq_development`

There are many ways to fix this situation, basically we need a user that has the createdb and login permissions

In PSQL:

    create role moosiq login createdb;
    CREATE ROLE

Then back in the rails app:

    rake db:create
    
Then back in PSQL:

    \list
    
	List of databases
    Name               | Owner 
	-------------------+-----------------
	moosiq_development | moosiq 
	moosiq_test        | moosiq

	\connect moosiq_development
	You are now connected to database "moosiq_development" as user "stuart".
	
	\dt
	No relations found.

##Rails: First Model


```
rails g model Agent first_name last_name phone_number
invoke  active_record
create    db/migrate/20140426000313_create_agents.rb
create    app/models/agent.rb
```

What does this do?

* Creates the migration file which will create the table
* Creates the model file
* __Leaves the database unchanged__
* __Leaves the schema file unchanged__

```
\dt
No relations found.
```

__Still no table, let's run db:migrate__

```
rake db:migrate

== 20140426000313 CreateAgents: migrating =====================================
-- create_table(:agents)
   -> 0.0096s
== 20140426000313 CreateAgents: migrated (0.0097s) ============================

```

__Now our Table Exists__

```
\dt
              List of relations
 Schema |       Name        | Type  | Owner  
--------+-------------------+-------+--------
 public | agents            | table | moosiq
 public | schema_migrations | table | moosiq
(2 rows)

```
__Add our db/schema.rb__ is updated

```
ActiveRecord::Schema.define(version: 20140426000313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
```

__Congratulations__ your model is available for use!


#Rails: Common Associations
##belongs_to

* [Docs for belongs_to](http://guides.rubyonrails.org/association_basics.html#the-belongs-to-association)


### Generating the Model
Let's create our Band model, instances of which `belongs_to` instances of our `Agent` model


```
rails g model Band name signed_on:date agent:references

invoke  active_record
create    db/migrate/20140426002031_create_bands.rb
create    app/models/band.rb

```

This model table will be called `bands` and have a foreign key column of `agent_id`


Let's look at the database:

__PSQL:__

```
SELECT * from bands;
ERROR:  relation "bands" does not exist
LINE 1: SELECT * from bands;
                      ^
```

__OOPS!__

What are we missing?


### Running the Migration

This is what the migration looks like:

`db/migrate/20140426002031_create_bands.rb`


```
class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.date :signed_on
      t.references :agent, index: true

      t.timestamps
    end
  end
end
```

```
rake db:migrate
```

Now our SELECT would work

### Using the Model

This is that the model looks like:

__app/models/band.rb__

```
class Band < ActiveRecord::Base
  belongs_to :agent
end
```

```
rails c

Agent.all
Agent Load (1.1ms)  
SELECT "agents".* FROM "agents"
=> #<ActiveRecord::Relation []>    
```

```
bob = Agent.create(first_name: 'Bob', last_name: 'Williams', phone_number: '(415) 555-5551')
(0.1ms)  BEGIN
SQL (5.5ms)
INSERT INTO "agents" ("created_at", "first_name", "last_name", "phone_number", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["created_at", Sat, 26 Apr 2014 00:34:37 UTC +00:00], ["first_name", "Bob"], ["last_name", "Williams"], ["phone_number", "(415) 555-5551"], ["updated_at", Sat, 26 Apr 2014 00:34:37 UTC +00:00]]
(0.6ms)  COMMIT

=> #<Agent id: 1, first_name: "Bob", last_name: "Williams", phone_number: "(415) 555-5551", created_at: "2014-04-26 00:34:37", updated_at: "2014-04-26 00:34:37"> 
```

```
Band.all
Band Load (1.9ms)  
SELECT "bands".* FROM "bands"
=> #<ActiveRecord::Relation []> 
```

```
beafles = Band.create(name: 'Beafles', signed_on: Time.now, agent: bob)
(0.2ms)  BEGIN
SQL (0.9ms)  
INSERT INTO "bands" ("agent_id", "created_at", "name", "signed_on", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["agent_id", 1], ["created_at", Sat, 26 Apr 2014 00:37:31 UTC +00:00], ["name", "Beafles"], ["signed_on", Fri, 25 Apr 2014], ["updated_at", Sat, 26 Apr 2014 00:37:31 UTC +00:00]]
(0.3ms)  COMMIT

=> #<Band id: 1, name: "Beafles", signed_on: "2014-04-25", agent_id: 1, created_at: "2014-04-26 00:37:31", updated_at: "2014-04-26 00:37:31"> 
``` 
###Using Belongs to

```
beafles.agent

=> #<Agent id: 1, first_name: "Bob", last_name: "Williams", phone_number: "(415) 555-5551", created_at: "2014-04-26 00:34:37", updated_at: "2014-04-26 00:34:37"> 
```

##has_many

* [has_many](http://guides.rubyonrails.org/association_basics.html#the-has-many-association)

We generated the model and the migration with the foreign key in the belongs_to example step, we can just add the has_many block to our Agent class:


<pre>
 class Agent < ActiveRecord::Base
   <b>has_many :bands</b>
 end
</pre>

This works because ActiveRecord knows to look for the column `agent_id` in the `bands` table

```
rails c

bob = Agent.find_by(first_name: 'Bob')
Agent Load (0.4ms)  
SELECT "agents".* FROM "agents" WHERE "agents"."first_name" = 'Bob' LIMIT 1
=> #<Agent id: 1, first_name: "Bob", last_name: "Williams", phone_number: "(415) 555-5551", created_at: "2014-04-26 00:34:37", updated_at: "2014-04-26 00:34:37"> 
2.1.0 :006 > 
```

Raw Association:
```
rails c

bob.bands
Band Load (0.6ms)
SELECT "bands".* FROM "bands" WHERE "bands"."agent_id" = $1  [["agent_id", 1]]
=> #<ActiveRecord::Associations::CollectionProxy [#<Band id: 1, name: "Beafles", signed_on: "2014-04-25", agent_id: 1, created_at: "2014-04-26 00:37:31", updated_at: "2014-04-26 00:37:31">]> 
```
Using as an array:
```
rails c

bob.bands.map(&:name)
 => ["Beafles"] 
```


```

bob.bands.create(name: 'The Wilfreds', signed_on: Time.now)
(0.1ms)  BEGIN
SQL (1.6ms)
INSERT INTO "bands" ("agent_id", "created_at", "name", "signed_on", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["agent_id", 1], ["created_at", Sat, 26 Apr 2014 00:53:50 UTC +00:00], ["name", "The Wilfreds"], ["signed_on", Fri, 25 Apr 2014], ["updated_at", Sat, 26 Apr 2014 00:53:50 UTC +00:00]]

(0.4ms)  COMMIT
=> #<Band id: 2, name: "The Wilfreds", signed_on: "2014-04-25", agent_id: 1, created_at: "2014-04-26 00:53:50", updated_at: "2014-04-26 00:53:50"> 

```
 
##has_many through (Part 1)

An `Artist` is a member of a band for a period of time.

I've called this period of time a `Stint`

Each `Stint` has a `Band`, an `Artist` as well as `start_date` and `end_date`


```
rails g model Artist name
      invoke  active_record
      create    db/migrate/20140426012337_create_artists.rb
      create    app/models/artist.rb
rails g model Stint artist:references band:references start_date:date end_date:date
      invoke  active_record
      create    db/migrate/20140426012409_create_stints.rb
      create    app/models/stint.rb
```


<pre>
 class Artist < ActiveRecord::Base
   <b>has_many :stints</b>
 end
</pre>

<pre>
 class Band < ActiveRecord::Base
   belongs_to :agent
   <b>has_many :stints</b>
 end
</pre>

<pre>
 class Stint < ActiveRecord::Base
   <b>belongs_to :artist</b>
   <b>belongs_to :band</b>
 end
</pre>

You can see that we have two has_many and their two matching belongs_to relationships


```
rails c

Artist.create(name: "Wilber")
wilber = Artist.find_by(name: 'Wilber')
Artist Load (1.3ms)  
SELECT "artists".* FROM "artists" WHERE "artists"."name" = 'Wilber' LIMIT 1
=> #<Artist id: 1, name: "Wilber", created_at: "2014-04-26 01:26:24", updated_at: "2014-04-26 01:26:24"> 
```

```
beafles = Band.find_by(name: 'Beafles')
Band Load (1.1ms)  
SELECT "bands".* FROM "bands" WHERE "bands"."name" = 'Beafles' LIMIT 1
=> #<Band id: 1, name: "Beafles", signed_on: "2014-04-25", agent_id: 1, created_at: "2014-04-26 00:37:31", updated_at: "2014-04-26 00:37:31"> 
```

###Create a New Stint via the has_many relationship

```
wilber.stints.create(band: beafles, start_date: Time.now)
(0.1ms)  BEGIN
SQL (1.7ms)
INSERT INTO "stints" ("artist_id", "band_id", "created_at", "start_date", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["artist_id", 1], ["band_id", 1], ["created_at", Sat, 26 Apr 2014 01:29:36 UTC +00:00], ["start_date", Fri, 25 Apr 2014], ["updated_at", Sat, 26 Apr 2014 01:29:36 UTC +00:00]]
(0.6ms)  COMMIT
=> #<Stint id: 1, artist_id: 1, band_id: 1, start_date: "2014-04-25", end_date: nil, created_at: "2014-04-26 01:29:36", updated_at: "2014-04-26 01:29:36"> 
2.1.0 :009 > 
```

##has_many through (Part 2)

* [has_many through:](http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association)

But what is the relationship between `Band` and `Artist` ?

<pre>
 class Band < ActiveRecord::Base
   belongs_to :agent
   has_many :stints
   <b>has_many :artists, through: :stints</b>
 end
</pre>

We don't need another migration because all the data already exists, `ActiveRecord` does the magical `JOIN`s for us

```
beafles.artists
=> #<ActiveRecord::Associations::CollectionProxy [#<Artist id: 1, name: "Wilber", created_at: "2014-04-26 01:26:24", updated_at: "2014-04-26 01:26:24">]> 
2.1.0 :004 >
```

<pre>
class Artist < ActiveRecord::Base
  has_many :stints
  <b>has_many :bands, through: :stints</b>
end
</pre>


```
wilber.bands.map(&:name)
  Band Load (3.8ms)  SELECT "bands".* FROM "bands" INNER JOIN "stints" ON "bands"."id" = "stints"."band_id" WHERE "stints"."artist_id" = $1  [["artist_id", 1]]
 => ["Beafles"] 
```

#Less Common Associations

##has_one

* [has_one](http://guides.rubyonrails.org/association_basics.html#the-has-one-association)

Like belongs_to except the foreign key is in the other other table (the same table as it would be for has_many)

##has_one through:

* [has_one through:](http://guides.rubyonrails.org/association_basics.html#the-has-one-through-association)

Like has_many through except it's singular )

##has_and_belongs_to_many

* [has_and_belongs_to_many](http://guides.rubyonrails.org/association_basics.html#has-and-belongs-to-many-association-reference)

More complicated to set up, requires a separate migration for the join table, similar to has_many through in many ways except there's no data associated with the join

#Related Notes
* [Associations Docs](http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html)

* [Model field data types](http://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/TableDefinition.html#method-i-column
