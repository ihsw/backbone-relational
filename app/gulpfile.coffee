gulp = require 'gulp'
server = require 'gulp-develop-server'
uglify = require 'gulp-uglify'
concat = require 'gulp-concat'
minifyCss = require 'gulp-minify-css'

gulp.task 'vendor-js:build', ->
  srcs = [
    'bower_components/underscore/underscore-min.js'
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

gulp.task 'server:start', -> server.listen { path: './app.js' }
gulp.task 'server:restart', -> gulp.watch ['./app.coffee'], server.restart
gulp.task 'default', [
  'vendor-js:build', 'vendor-css:build'
  'server:start', 'server:restart'
]
