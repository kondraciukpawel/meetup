var gulp = require('gulp');
var autoprefixer = require('gulp-autoprefixer');
var coffee = require('gulp-coffee');
var concat = require('gulp-concat');
var livereload = require('gulp-livereload');
var plumber = require('gulp-plumber');
var rename = require('gulp-rename');
var sass = require('gulp-ruby-sass');
var sourcemaps = require('gulp-sourcemaps');
var uglify = require('gulp-uglify');
var util = require('gulp-util');

var bowerDir = './vendor/assets/components';
var sassDir = './app/assets/stylesheets';

var config = {
  sass: {
    src: [sassDir + '/application.sass'],
    watchSrc: [sassDir + '/**/*.sass'],
    options: {
      sourcemap: true,
      lineNumbers: true,
      loadPath: [
        bowerDir + '/bootstrap-sass/assets/stylesheets',
        bowerDir + '/font-awesome/scss'
      ]
    }
  }
}

gulp.task('sass', function() {
  return sass(config.sass.src, config.sass.options)
    .pipe(autoprefixer())
    .pipe(rename('application.css'))
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest('./public/assets/'))
});

gulp.task('watch-sass', function() {
  gulp.watch(config.sass.watchSrc, ['sass']);
});