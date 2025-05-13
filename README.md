# README

## Prerequisites

This app can be set up and run on Windows/Linux or Mac. The following software must be set up

* MySQL Server
* Ruby with Ruby on Rails gem installed

## Initial Setup

We need to create the DB and seed with the initial data before starting the app for the first time.
We want to do this per location, so we will pass in the LOCATION_ID env variable. The current location
should correspond to the location you are based in. In the below examples, location 13 (Sweet Cafe) is used

First, lets add our database credentials to the Rails Appliction Credentials. In command line

```
VUSIAL=[preferred text editor (e.g.vi)] rails credentials:edit
```

the add credentials in yaml formart

``` yml
database:
  username: [username]
  password: [password]
```

Now we are read to create and seed our database. The latest available version of the spreadsheet is saved in the repo and will be used to seed the data for the location.

```
rails db:create
LOCATION_ID=13 rails db:seed
```

## Starting the App

To start the app, run the following:

```
LOCATION_ID=13 rails s
```

to use the app, visit http://localhost:3000
