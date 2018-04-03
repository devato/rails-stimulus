const { environment } = require('@rails/webpacker')

// Setup jquery
const webpack = require('webpack')
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  JQuery: 'jquery',
  Popper: ['popper.js', 'default']
}))

// resolve-url-loader must be used before sass-loader
environment.loaders.get('sass').use.splice(-1, 0, {
  loader: 'resolve-url-loader'
});


module.exports = environment
