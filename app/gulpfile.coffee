gulp = require 'gulp'
server = require 'gulp-develop-server'
uglify = require 'gulp-uglify'
concat = require 'gulp-concat'
minifyCss = require 'gulp-minify-css'
coffee = require 'gulp-coffee'

gulp.task 'vendor-js:build', ->
  srcs = [
    'bower_components/underscore/underscore-min.js'
    'bower_components/jquery/dist/jquery.min.js'
    'bower_components/backbone/backbone-min.js'
    'bower_components/backbone-relational/backbone-relational.js'
  ]
  gulp.src(srcs)
    .pipe(concat('vendor.js'))
    .pipe(uglify())
    .pipe gulp.dest 'dist'
gulp.task 'vendor-css:build', ->
  srcs = [
    'bower_components/bootstrap/dist/css/bootstrap.min.css'
  ]
  gulp.src(srcs)
    .pipe(concat('vendor.css'))
    .pipe(minifyCss())
    .pipe gulp.dest 'dist'
gulp.task 'client-js:build', ->
  srcs = [
    'client/**/*.coffee'
  ]
  gulp.src(srcs)
    .pipe(coffee())
    .pipe(concat('client.js'))
    .pipe gulp.dest 'dist'
gulp.task 'client-js:watch', ->
  gulp.watch 'client/**/*.coffee', ['client-js:build']

gulp.task 'server:start', -> server.listen { path: './app.js' }
gulp.task 'server:restart', -> gulp.watch ['./app.coffee'], server.restart
gulp.task 'default', [
  'vendor-js:build', 'vendor-css:build'
  'client-js:build', 'client-js:watch'
  'server:start', 'server:restart'
]
