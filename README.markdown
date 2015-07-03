# Guestbook

This project is a simple guestbook. The user can list, add and delete entries in a single view.

## Setup Instructions

* `git clone` the repo
* `cd guestbook`
* `bundle install`
* `rake db:migrate` (the `db` is `sqlite3`, so only this command should do the trick)
*  `rails server`

Now you should be able to access the application at `http://localhost:3000`.

# Running tests:

The tests use the following gems: `rspec-rails`, `capybara`, `factory_girl_rails` and `shoulda-matchers`.

To run the tests, you can do one on the following options:

* `rspec spec` (run all the tests)
* `rspec spec -fd` (will also display the passing tests)
* `rspec spec/path_to_file` (you can test an specific file)
