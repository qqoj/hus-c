HUS-C
=====

Runs on ruby 2.2.4

Prepare the environment
-----------------------

```
> gem install bundler
```

Run tests
---------

```
> bundle install
> RAILS_ENV=test bundle exec rake db:drop db:create db:schema:load factory_girl:lint spec
```

Deploy
------

```
> bundle install --without development test
> RAILS_ENV=production bundle exec rake restart
```