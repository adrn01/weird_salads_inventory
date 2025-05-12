# README

We need to create the DB and seed with the initial data before starting the app for the first time.
We want to do this per location, so we will pass in the LOCATION_ID env variable.

```
rails db:create
LOCATION_ID=13 rails db:seed
```