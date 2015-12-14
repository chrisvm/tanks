
gulp = require 'gulp'
coffee = require 'gulp-coffee'

gulp.task 'coffee', ->
  gulp.src './coffee/**/*.coffee'
    .pipe coffee(bare: true).on 'error', console.error
    .pipe gulp.dest './build/js'

gulp.task 'watch', ->
  gulp.watch './coffee/**/*.coffee', ['coffee']
