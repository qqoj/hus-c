# HUS-C

[HUS-C](http://eve.sirlon.org/) is an [EVE](http://www.eveonline.com/) marketplace tool

## Setup
Windows/Mac: [RailsInstaller](http://railsinstaller.org/)

### Run tests
```
$ RAILS_ENV=test bundle exec rake db:drop db:create db:schema:load factory_girl:lint spec
```

### Update EVE databases
Extract the [SDE](https://developers.eveonline.com/resource/resources) pack to db/eve
```
$ RAILS_ENV=production bundle exec rake db:migrate db:seed
```

### Deploy
```
$ git pull && bundle install --without development test && RAILS_ENV=production bundle exec rake restart
```

## Stories

+ Copy-paste blueprints and list them
+ Show material cost
+ Show sell price
+ Show profit per hour
+ Use market prices
- Sort all blueprints by profit
+ Show materials m3 and m3 per hour
- Show price of the blueprint itself
+ System-specific prices