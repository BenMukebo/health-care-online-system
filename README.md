# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



bin/dev
js: yarn build --watch 
css: yarn build:css --watch


- Docs:
* [Tailwind CSS in Rails 7](https://reinteractive.com/articles/tailwind-css-in-rails-7)
* [How to Setup Tailwind 3 on Rails 7](https://dev.to/software_writer/how-to-setup-tailwind-3-on-rails-7-2dbo)

Step 5: Start the Tailwind CLI build process

Run the following command from the root directory of your Rails application. This will watch for the changes in the view files.

```bin
$ npx tailwindcss -i app/assets/stylesheets/application.css -o app/assets/stylesheets/wind.css --watch
```