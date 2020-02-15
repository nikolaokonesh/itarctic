let environment = {
  plugins: [
    require('autoprefixer'),
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    }),
  ]
}


// Only run PurgeCSS in production(you can also add staging here)
if (process.env.RAILS_ENV === "development") {
  environment.plugins.push(
    require('@fullhuman/postcss-purgecss')({
      content: [
        './app/**/*.html.erb',
        './app/**/*.js.erb',
        './app/helpers/**/*.rb',
        './app/javascript/**/*.js',
        './node_modules/photoswipe/**/*.js',
        './node_modules/trix/**/*.js',
        './node_modules/@uppy/**/*.js',
        './node_modules/bootstrap/**/*.js',
        './node_modules/popper.js/**/*.js',
        // './app/javascript/**/*.vue',
        // './app/javascript/**/*.jsx',
      ],
      defaultExtractor: content => content.match(/[A-Za-z0-9-_:/]+/g) || []
    })
  )
}

module.exports = environment
