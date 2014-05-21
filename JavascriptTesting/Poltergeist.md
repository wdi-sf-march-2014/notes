#Poltergeist

##Javascript Errors

Because of this:
[Poltergeist 0.6.0 Notes](http://www.jonathanleighton.com/articles/2012/poltergeist-0-6-0/) :
Poltergeist 0.6.0 updates the PhantomJS dependency to 1.5, and so I am happy to say that if there is a Javascript error in your page (or in Poltergeist’s Javascript code), the error will trigger an exception in your Capybara test, and you’ll see a full stack trace showing where it happened.

Capybara Rspec tests will show javascript errors

