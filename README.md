# Seabrook

Book club prompt organization and voting

Named after the beach town [Seabrook, WA](https://www.google.com/maps/place/Seabrook,+WA/@47.1978284,-124.2015807,16z/data=!4m5!3m4!1s0x54920d9c7ab3e9fb:0xc7ec646742447dcf!8m2!3d47.1955483!4d-124.1963636a) (get it?)

Please see our development [backlog](https://www.pivotaltracker.com/n/projects/2186995)

## Tech stack
[Grape](https://github.com/ruby-grape/grape) (a ruby microframework) and MongoDB.

Future: Slack integration also

## Development
Install MongoDB: https://docs.mongodb.com/manual/administration/install-community/

```
bundle install
rake --tasks
```

Or, if you have `seabrook-web` cloned as a sibling of this directory, you can use [foreman](https://github.com/ddollar/foreman) to run the db, API, and frontend:
```
gem install foreman
foreman start
```

## Deployment
See PCF `manifest.yml`. Assumes a MongoDB service has been created with name "mongodb".

Note also `.travis.yml`

## MongoDB cheatsheet
Connect to the instance:
`mongo mongodb://....`

In the Mongo shell:
```
meetings = db.meetings
meetings.updateOne(
  { date: ISODate("2018-08-28") },
  { $set: { "topics": [] } }
)
```

## Miscellaneous thoughts
Might be interesting to try pure functional on the backend as well - Elixir/Phoenix?
