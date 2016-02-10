# YELP clone

This application reproduce the Yelp app using Ruby and Ruby on Rails.

## Objectives of exercise

Object orientation, folder structure, migrating the Databases correctly, test-driving everything.

## Technologies used

* Ruby
* Ruby on Rails
* Capybara
* Rspec
* HTML
* Postgresql
* Phantom.js
* Poltergeist

## To run it:
```
$ git clone https://github.com/Mattia46/Yelp/
$ bundle
$ bin/rails s
```
#### If you haven't got Postgres installed, run:

```
$ brew install postgresql
$ bundle
```
#### Then:
```
$ bin/rake db:create
$ bin/rake db:migrate RAILS_ENV=development
$ rails s
```
#### Go to your browser and paste:
```
http://localhost:3000
```
## How to test it
```
$ brew install phantomjs
$ rspec
```
