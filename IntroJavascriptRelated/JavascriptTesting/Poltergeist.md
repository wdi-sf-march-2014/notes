#Poltergeist

* A PhantomJS driver for Capybara
* [https://github.com/teampoltergeist/poltergeist](https://github.com/teampoltergeist/poltergeist)
* Allows us to run our app's webpages in PhantomJS AND have the javascript execute
* Our Feature tests can use Capybara to interact with the page like a user
* Our Feature tests can use Capybara to check the impact of our javascript on the page


#Setup

* Install phantomjs

    $ brew install phantomjs

* Add ```gem 'poltergeist'``` to ```Gemfile```
* ```bundle install```


* ```spec_helper.rb```

    Capybara.javascript_driver = :poltergeist
    Capybara.default_driver = :poltergeist
    Capybara.current_driver = :poltergeist

* ```kindergarden_spec.rb``` includes ```, js: true```


    require "spec_helper"

    feature "Kindergarden", js: true do
      scenario "Kindergarden on page load" do
        visit kindergarden_path

        #Part A
        expect(page).to have_css("#kindergarden_red_thing.jplay_red.thing.thing_of_interest", text: "I'm Red")
        expect(page).to have_css("#kindergarden_blue_thing.jplay_blue.thing.thing_of_interest", text: "I'm Blue")
        expect(page).to have_css("#kindergarden_green_thing.jplay_green.thing.thing_of_interest", text: "I'm Green")

        #Part B
        expect(page).to have_css("#kindergarden_ball_container_b > .ball.thing_of_interest", count: 8)
        expect(page).to have_css("#kindergarden_ball_container_b .red_bucket .thing_of_interest", count: 0)

        #Part C
        # Only one ball with thing_of_interest, and that one is inside the red_bucket
        expect(page).to have_css("#kindergarden_ball_container_c .thing_of_interest", count: 1)
        expect(page).to have_css("#kindergarden_ball_container_c .red_bucket .ball.thing_of_interest", count: 1)

      end
    end



##Get Javascript Errors

Because of this:
[Poltergeist 0.6.0 Notes](http://www.jonathanleighton.com/articles/2012/poltergeist-0-6-0/) :
Poltergeist 0.6.0 updates the PhantomJS dependency to 1.5, and so I am happy to say that if there is
a Javascript error in your page (or in Poltergeist’s Javascript code), the error will trigger an
exception in your Capybara test, and you’ll see a full stack trace showing where it happened.

Capybara Rspec tests will show javascript errors

