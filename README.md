# README

Notes app implemeted using Rails, Ruby, Scss, Bootstrap, coffescript, mongodb. The app faciliates
the user to: 
  1. Create the notes
  2. Store the notes
  3. View the notes
  4. Delete the notes
  5. Search by tags or title.
It's a renposive app.

To set mongodb as your batabase:
  1. Generate rails app without active-record
    `rails new appname --skip-active-record` or `rails new appname -O`
  2. Add mondoid gem to gemfile
  3. bundle install
  4. run rails g mongoid:config
  5. rake db:migrate


* Ruby version - 2.5.1

* Rails version - 5.2.1

* Configuration - 
  * Database initialization - rails g mongoid:config

* Deployment instructions
    Precomplie assets `rake assets:precompile`
    migrate db
    
