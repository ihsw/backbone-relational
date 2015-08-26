gulp = require 'gulp'
server = require 'gulp-develop-server'

gulp.task 'server:start', -> server.listen { path: './app.js' }
gulp.task 'server:restart', -> gulp.watch ['./app.coffee'], server.restart
gulp.task 'default', ['server:start', 'server:restart']