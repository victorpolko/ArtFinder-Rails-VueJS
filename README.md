# Rails application for art collections

### What?
A test task: create an app for artworks using Rails and VueJS.

### Why?
To find out how VueJS works in a Rails app.

### Where?
I managed to deploy it to Heroku so the results are all [here](https://artfinder-rails.herokuapp.com/). Heroku doesn't work well with pictures served from Asset Pipeline, so no pictures, sorry.

---

## Install
```bash
$ bin/setup
```
This will install gems and npm packages, create *database.yml* file for you and will fail at creating the DB.
You will have to change the *database.yml* and then rerun `bin/setup`.

## Run
```bash
$ bundle exec rails server
```
This will launch a Thin instance at http://localhost:3000 for you.
