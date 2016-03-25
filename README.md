HUS-C
=====

Prepare the environment (ruby 2.2.4)

```
> gem install bundler
```

Deploy
```
> git pull && bundle install --without development test && RAILS_ENV=production bundle exec rake restart
```

Stories
=======

- Copy-paste blueprints and list them

For each blueprint:
- Show material cost
- Show sell price
- Show profit per hour