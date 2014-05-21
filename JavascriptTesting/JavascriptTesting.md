Intro to Javascript Testing
==================

![Good Morning](http://clients.stujophoto.com/Portfolio/Landscapes/i-Fb8QCC7/1/L/2013-xmas-5281-L.jpg)

[_Jump!_](http://clients.stujophoto.com/)


#Objectives
Before we can test real world javascript applications we need to know about some fairly complex tools and concepts 

* Understand Closures
* Understand How to Expose Functionality in JavaScript
* Use jasmine template to unit test Javascript without jQuery
* Use PhantomJS to run javascript enabled web pages without a browser
* Use Capybara with PhantomJS and RSpec for feature testing

#Closures

[Exposing Functionality](./exposing_functions/README.md)

#Basic Jasmine

[Jasmine Notes](./jasmine/README.md)

#Phantom JS

[PhantomJS Notes](./phantomjs/PhantomJS.md)

#Feature Testing

I've updated jplayground to include feature tests running in PhantomJS to test your solutions!

    [/jplayground (master)]$ git checkout solutions
    [/jplayground (solutions)]$ rspec

    [/jplayground (solutions)]$ git checkout master
    [/jplayground (master)]$ rspec

##Running the updated RSPEC tests
However, the challenge is that when you probably cloned the repo, these tests were not in the repo!

Also I've made some changes to the starting grounds/*.js files to fix some typos :)

However it should be possible to sync and rebase your cloned repo with my new tests and run them

I've not been able to test this, so I'll ask for a volunteer to come up so we can do this!

    cd projects/jplayground

    git status

    # Make sure all your changes are checked in

	
    # Add the remote, call it "upstream":

    git remote add upstream https://github.com/stujo/jplayground.git

    # Fetch all the branches of that remote into remote-tracking branches,
    # such as upstream/master:

    git fetch upstream

    # Make sure that you're on your master branch:

    git checkout master

    # Rewrite your master branch so that any commits of yours that
    # aren't already in upstream/master are replayed on top of that
    # other branch:

    git rebase upstream/master