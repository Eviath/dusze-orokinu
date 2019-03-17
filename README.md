[![Build Status](https://travis-ci.com/Eviath/dusze-orokinu.svg?token=zyxZxqWQUqpV3Z3nzsP8&branch=master)](https://travis-ci.com/Eviath/dusze-orokinu)

# Dusze Orokinu - "Warframe" Gaming Community



![IndexPage](https://i.imgur.com/gvUAZ9N.jpg)

---

# About Project

> Core
- Ruby 2.6.1
- Rails 5.2.2
- Bootstrap 4.1
- HAML Syntax
- Sass
- Coffee & JQuery

 
> Features
- Messaging System
- User register & login with e-mail activation and password resets
- User Roles
- Community groups requests
- News
- Featured
- Commenting system
- Admin Panel
- User Panel


---

> Author
- Project created by https://eviathos.pl

---

> License
- All rights reserved.

> Installation Guide

- Clone repo `git clone git@github.com:Eviath/dusze-orokinu.git`
- Bundle gems `bundle install`
- Bundle npm packages `npm install`
- Make sure packages are integrated with yarn `yarn install --check-files`
- Create database, run migrations and seed database `rake db:setup`

> FAQ

##### You must use bundler 2.0 or greater with this lockfile
- `gem update --system`
- `gem install bundler`
- `bundler update --bundler`


##### ./bin/webpack-dev-server Permission denied
- `chmod -R 777 ./bin`
- `chmod -R 777 ./bin/webpack-dev-server`
