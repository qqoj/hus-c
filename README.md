HUS-C
=====

Prepare the environment (ruby 2.2.4)
```
> gem install bundler
```

Update EVE databases
```
> RAILS_ENV=production bundle exec rake db:migrate db:seed
```

Deploy
```
> git pull && bundle install --without development test && RAILS_ENV=production bundle exec rake restart
```

Tests
```
> RAILS_ENV=test bundle exec rake db:drop db:create db:schema:load factory_girl:lint spec
```

Stories
=======

- Copy-paste blueprints and list them

For each blueprint:
- Show material cost
- Show sell price
- Show profit per hour
