# README

I am following _this tutorual:_ [https://www.hotrails.dev/turbo-rails/turbo-rails-tutorial-introduction](https://www.hotrails.dev/turbo-rails/turbo-rails-tutorial-introduction)

# Joe's Dev Notes

* started with: `rails new quote-editor --css=sass --javascript=esbuild --database=postgresql`
* Needed to use an older version of node to not have sass dart errors on `rails new`. Needed to first create an `.nvmrc` file `echo 20 > .ncmrc` before running the generator commands.
* Needed to reinstall postgres. Went from v14 to the latest version: 16
* needed to add gem executable dir to path and install foreman so bin/dev would actually work
* needed to reinstall pg gem to pick up new postgres version
* had to run `bin/rails db:create`
