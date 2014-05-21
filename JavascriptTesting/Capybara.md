#Capybara

* Acceptance test framework for web applications
* [https://github.com/jnicklas/capybara](https://github.com/jnicklas/capybara)
* Feature specific DSL: ```feature```,```background```,```scenario``` and ```given```
* Aliases for: ```describe```,```before```,```it``` and ```let```
* Create specs in ```spec/features```

#Setup

* Add ```gem 'capybara'``` to ```Gemfile```
* ```bundle install```
* Add ```require 'capybara/rspec'``` to ```spec_helper.rb```

    $ brew install phantomjs


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

#Rspec

Run tests with

    $ rspec

