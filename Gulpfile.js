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
var destDir = './public/assets/';
var jsDir = './app/assets/javascripts/';

var paths = {
  vendorJs: [
    bowerDir + '/jquery/dist/jquery.js',
    bowerDir + '/underscore/underscore.js',
    bowerDir + '/backbone/backbone.js',
    bowerDir + '/backbone.marionette/lib/backbone.marionette.js'
  ]
}

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
  },
  coffee: {
    src: [jsDir + '**/*.coffee'], 
    watchSrc: [jsDir + '/**/*.coffee'],
    options: {
      
    }
  }
}

/*
 *        SASS 
 */

gulp.task('sass', function() {
  return sass(config.sass.src, config.sass.options)
    .pipe(autoprefixer('last 3 version'))
    .pipe(rename('application.css'))
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest(destDir))
});

gulp.task('watch-sass', function() {
  gulp.watch(config.sass.watchSrc, ['sass']);
});

/*
 *         JavaScript
 */

gulp.task('vendor-js', function() {
  return gulp.src(paths.vendorJs)
    .pipe(sourcemaps.init())
    .pipe(concat('vendor.js'))
    .pipe(uglify())
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest(destDir));
});

gulp.task('js', function () {
  return gulp.src(config.coffee.src)
    .pipe(sourcemaps.init())
    .pipe(coffee(config.coffee.options))
    .pipe(concat('app.js'))
    .pipe(uglify())
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest(destDir));
});

gulp.task('watch-js', function() {
  gulp.watch(config.coffee.watchSrc, ['js']);
});