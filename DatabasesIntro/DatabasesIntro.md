Draft - Do Not Use Yet!
====================

Introduction To Databasess
==================

![Race Car](http://clients.stujophoto.com/photos/i-kPJSjw7/1/L/i-kPJSjw7-L.jpg)

__Credit for these great notes goes to [Tim Garcia](https://github.com/tigarcia)__

*"The point of the backend is to store, manipulate, and retrieve data."*


# Pre-Work Required For Lesson
##Install Postgres.app
### Mac OSX - Install Postgres.app 
For the lesson we will be using Postgres as our database to demonstrate and practice what we are learning.  Postgres can be installed many ways, but for our purposes, Postgres.app will be the best option.  Please follow the instructions below if you have not done so already.

* Go to [http://postgresapp.com/](http://postgresapp.com/)

* Download and install

* Follow the __Command-Line Tools__ here:
  * [http://postgresapp.com/documentation/](http://postgresapp.com/documentation/)
	

### Ubuntu - Install Postgres.app

	
```
	https://help.ubuntu.com/community/PostgreSQL
```


### Both Ubuntu and MAC OSX

* Verify the install was successful by typing ```psql``` in your terminal.  ```\q``` to quit.



__IF THIS DOES NOT WORK, STOP IMMEDIATELY AND GET HELP FROM AN INSTRUCTOR__


##Install	Client Gem
	
* Next install the pg gem if you have not done so already 

```
gem install pg
```

# Objectives And Scope
* Install Postgres (server / client) onto your laptop
* Understand what a database is
* Get familiar with SQL (Create tables, insert, read, update, and delete)
* Use Postgres
* Use the pg gem to query the database from a ruby application.

__Note:__ Although this lesson covers basic SQL, it will not cover joins or more advanced nested queries.


# What is a database?

- Sometimes called a DBMS (Database Management System)
- It is a program that enforces structure on your data and allows a computer to quickly retreive data.
- A database should support CRUD operations.  
  - CRUD => Create, Read, Update, Destroy
  
## Why Use a Database?
Discuss as a class.  Why is it better than just writing to files?

* Data is structured
* Databases are transactional
* Data retrevial is fast
* Has a system for remote access
* Has a system for backup

## Types of Databases

__RDBMS (Relational Database Management System)__ The most common type of database today is a __relational database__.  Relational databases have tabular data with rows for each instance of data and columns for each attribut of that data.  Tables may refer to one another.  Relational databases typically use __SQL (Structured Query Language)__.

**Brands of RDBMS:**

* Postgres
* MySQL (Used to be very popular)
* Oracle (Commercial Product with lots of features)
* Microsoft SQL Server
* SQLite (Good for mobile development/Small applications)
* BerkleyDB (Similar to SQLite)


__Cloud Storage__  This is a very vague term and can be used to mean lots of things.  Typically it is a system in which your data is stored and managed by a company so you don't have to worry about losing it.  Examples included __AWS (Amazon Web Services)__,  __Rackspace Cloud Storage__, __MS Azure__

__NoSQL__ There is also a school of thought called NoSql.  It is often a Key Value storage system and is not relational.  This is typically used in applications where a database does not scale well.  Example technologies include __MongoDB__, __Apache Couch__, __SimpleDB__.


## How are databases used in the wild?

For learning and testing purposes, we will be using Postgres on the same machine that our web server is running.  In the real world, your database will be on a separate machine, called a __database server__.  

A database server is a computer or group of computers that is dedicated to storing your data and handling remote requests to retreive that data. Even in a very simple configuration, the database server will have at least 1 backup machine that keeps an exact copy of the database just in case the main database server goes down.


# psql

If you installed Postgress.app you have access to psql from the elephant icon at the top of the screen:

* ![image](https://www.dropbox.com/s/ml1gk00asvqxmi6/psql-shortcut.png)

If you are using the command line:

* In your terminal, type ```psql```.  

__psql__ is the (a) command line tool to interact with postgres databases, by default it connects to the localhost database with the name of the current user


psql has some of it's own command which begin with `\`


List all of the available databases:

```
\list
```

List all of the available tables in the current database:

```
\dt
```

Check you connection information:

```
\conninfo   
```


There are lots of other commands which you can see with:

```
\?
```
Use `q` to exit the help screen

__ALL PSQL COMMANDS START WITH `\` __


At this point we should have a database with no tables in it.  So now we need to create tables - using SQL __(NOT to be confused with the psql app itself)__

# SQL: Structured Query Language

__A Brief History of Databases__

Before the notion of an RDBMS and a standard language for querying that data was created, there were many database venders.  Each vendor had different ways of storing data and very different ways of retreiving the data afterwards.  Moving data from one system to another was very costly.  Luckly in the 1970s SQL was created and later turned into a standard.  Modern relational databases are now based on the SQL standard, so moving from Postgres to Oracle is not nearly as much of a challenge as it used to be. 

__CRUD__

Stands for Create, Read, Update and Destroy.  This is the lifecycle of data in an applicatoin.  In SQL, CRUD can be mapped to the following __INSERT, SELECT, UPDATE, DELETE__.  We will walk through examples of in this section.


__ALL SQL COMMANDS MUST BE ENDED WITH A SEMICOLON IN THE PSQL SHELL__


## Creating a Database

Most database products have the notion of separate databases.  Lets create one for the lesson.  


```
CREATE DATABASE testdb;
```


Connect to a database 

```
\connect testdb

```
Once we connect, our command prompt should look similar to this: ```testdb=#```

List our tables:

```
\list
```


## CREATE-ing a Table

This is an example of a students table.  (We will talk about the primary key soon.)


```
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT,
    phone VARCHAR(15),
    email TEXT
);

```

Check that it's there:
```
\dt
```

Look at the table structure
```
 \d+ students
```

## INSERT-ing Data

```
INSERT INTO students 
(name, phone, email) 
VALUES 
('William Smith', '(415)555-5555', 'bill@example.com');

INSERT INTO students 
(name, phone, email) 
VALUES 
('Bob Jones', '(415)555-5555', 'bob@example.com');

```

## SELECT-ing Data

```
SELECT * FROM students;
```

```
SELECT * FROM students WHERE name = 'Bob Jones';
```

```
SELECT id, name FROM students;
```

## UPDATE-ing Data


```
UPDATE students SET email='bobby@example.com' WHERE name = 'Bob Jones';
```

##DELETE-ing Data

```
DELETE from students WHERE name = 'Mary';
->DELETE 0
```

```
DELETE from students WHERE email = 'bobby@example.com';
->DELETE 1
```


## DROP-ing a Table

```
DROP TABLE students;
```

#Database Schema Design

For this lesson, how to design a complete database system is out of scope.  We will discuss a few things here though.


The __Schema__ of the database is the set of create table commands that specify what the tables are and how they relate to each other.  For our very simple database example, here is the schema: 

```
testdb=# \d+ students
                                                    Table "public.students"
 Column |         Type          |                       Modifiers                       
--------+-----------------------+-------------------------------------------------------
 id     | integer               | not null default nextval('students_id_seq'::regclass) 
 name   | text                  |                                                       
 phone  | character varying(15) |                                                       
 email  | text                  |                                                       

```

## What is a Primary Key?

It denotes an attribute on a table that can uniquely identify the row.

### What does SERIAL Do?

SERIAL tells the database to automatically assign the next unused integer value to id whenever we insert into the database and do not specify id.  In general, if you have a column that is set to SERIAL, it is a good idea to let the database assign the  value for you.

## Data Types

Similar to how Ruby has types of data, SQL defines types that can be stored in the DB. Here are some common ones:

* Serial
* Integer
* Numeric // Numbers are exact, no rounding error
* Float // Rounding error is possible, but operations are faster than Numeric
* Text, Varchar
* Timestamp
* Boolean (True or False)

## Normalization

Normalization is a more advanced database design topic.  The idea behind normalization is that the data in your table should not be repeated.  The introduction of the [wikipedia article on normalization](http://en.wikipedia.org/wiki/Database_normalization) gives a good summary.

## ER Diagrams

Creating an ER diagram can be useful if you are designing a DB with lots of tables and relationships to one another.  Again, this topic is out of scope, but it may be useful to revist ER Diagrams after you have a firm understanding of databases.  Here are some useful resources:

* [Wikipedia - ER Diagram](http://en.wikipedia.org/wiki/Entity-relationship_model)
* [Ultimate Guide To ER Diagrams](http://creately.com/blog/diagrams/er-diagrams-tutorial/) - Not so ultimate, but a good intro.

# psql and SQL Review

* CREATE a Database:

```
	CREATE DATABASE testdb;
```

* Connect to the new database:

```
	\connect testdb

 ->You are now connected to database "testdb" as user "stuart".
	
```

* CREATE a TABLE

```
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT,
    phone VARCHAR(15),
    email TEXT
);
```

* INSERT

```
INSERT INTO students 
(name, phone, email) 
VALUES 
('Mary Wilson', '(510)-555-5555', 'bob@example.com');

```

* SELECT

```
SELECT id, email FROM students WHERE name = 'Bob Jones';
```

* UPDATE

```
UPDATE students SET email='bobby@example.com' WHERE name = 'Bob Jones';
```

* DELETE

```
DELETE from students WHERE name = 'Mary';
```

* QUIT psql 
```
/q
```


# Exercise Time

Design a table for a movie database.  Discuss a few things that a movie table may have.  Choose the appropriate data type for the data.  Make the CREATE TABLE command and execute it in psql.  Use \dt to verify that the table was created.  Once you're satisfied that the table is there, get rid of it using the DROP TABLE command.  Use \dt again to make sure that the table has been dropped.


Here is an example movies table schema:

```
CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title TEXT,
    description TEXT,
    rating INTEGER
);
```

```
INSERT INTO movies (title, rating) VALUES ('Batman Begins', 10);
```

Our new row of data will look something like this:

```
id       title             description    rating
0        Batman Begins                    10

```

Even though we did not specify an id, one was created anyways.  Since we have SERIAL as the data type of id , the database knows on a new insert to automatically assign a new unique id to the row.

## Selecting

A select statement allows you to get data from the database.  Here are the [docs on select](http://www.postgresql.org/docs/9.0/static/sql-select.html).  Also, postgres a good [tutorial on select](http://www.postgresql.org/docs/7.3/static/tutorial-select.html).  I'd recommend looking at the tutorial sometime after the lesson.

Given this table:

```
CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title TEXT,
    description TEXT,
    rating INTEGER
);
```
And these insert statements:

```
INSERT INTO movies (title, description, rating) VALUES('Cars', 'a movie', 9);
INSERT INTO movies (title, description, rating) VALUES('Back to the Future', 'another movie', 9);
INSERT INTO movies (title, description, rating) VALUES('Dude Wheres My Car', 'probably a bad movie', 3);
INSERT INTO movies (title, description, rating) VALUES('Godfather', 'good movie', 10);
INSERT INTO movies (title, description, rating) VALUES('Mystic River', 'did not see it', 7);
INSERT INTO movies (title, description, rating) VALUES('Argo', 'a movie', 8);
INSERT INTO movies (title, description, rating) VALUES('Gigli', 'really bad movie', 1);
```

This will select all the attributes from the movies table unconditionally.  Make sure not to forget the ; at the end of the state.  In SQL, semi colons are required to terminate statements.

```
SELECT * FROM movies;
````

We may not want all attribues though.  Let's say instead we only care about the titles of the movie and the description.  Here is the query we'd use:

```
SELECT title, description FROM movies;
```


This will select the titles from movies table where the rating is greater than 4. 

```
SELECT title FROM movies WHERE rating > 4;
```

You can also have more complex queries to get data.  The following query finds all the movies with a rating greater than 4 and with a title of Cars.

```
SELECT title FROM movies WHERE rating > 4 AND title = 'Cars';
```

SQL also supports an OR statement.  The following query will return any movie with a rating greater than 4, or any movies with the title Gigli.  In other words, if a movie called Gigli is found with a rating equal to 1, it will still be returned along with any movie with a rating greater than 4.

```
SELECT title FROM movies WHERE rating > 4 OR title = 'Gigli';
```

Let's say that we just want a list of the best movies of all time.  We can do a select statement that ensures ordering.  The DESC keyword tells it to order the rating in descending order. ASC is the default.

```
SELECT title, rating FROM movies ORDER BY rating DESC;
```

__IMPORTANT NOTE:__ If no order by clause is specified, the database does not give any guarentees on what order your data will be returned in.  At times it may seem like data you are getting back is in sorted order, but make sure not to rely on that in your code.  Only rely on a sort if you also have an ORDER BY clause.

We've gotten a list of movies back, but it's way too long for our uses.  Let's instead only get the top 5 movies that are returned using LIMIT:


```
SELECT title, rating FROM movies ORDER BY rating DESC LIMIT 5;
```

### Exercise

Write a query on the movie table to return the worst movie of all time.  There should be only 1 result returned.  The result should include the title, description and rating of the movie.

## Updating

The update statement is defined [here](http://www.postgresql.org/docs/9.1/static/sql-update.html) in the postgres docs.  It is used to change existing data in our database.

For example, if we do not think Gigli was actually that bad, and we want to change the rating to a 2, we can use an update statement:

```
UPDATE movies SET rating=2 WHERE title='Gigli';
```

## Deleting

Deleting works similarly to a select statement.  Here are the [docs on delete](http://www.postgresql.org/docs/8.1/static/sql-delete.html)

The statement below deletes the Dude Wheres My Car row from the database:

```
DELETE FROM movies WHERE title='Dude Wheres My Car';
```

We could also use compond statements here:

```
DELETE FROM movies WHERE id < 9 AND rating = 2;
```


