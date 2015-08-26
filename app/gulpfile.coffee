gulp = require 'gulp'
server = require 'gulp-develop-server'

# todo: pull in bower components into a vendor js file
# todo: pull in client code into a js file

gulp.task 'server:start', -> server.listen { path: './app.js' }
gulp.task 'server:restart', -> gulp.watch ['./app.coffee'], server.restart
gulp.task 'default', ['server:start', 'server:restart']