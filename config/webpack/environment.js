const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.append("Provide", new webpack.ProvidePlugin({
  $: 'jquery/src/jquery',
  jQuery: 'jquery/src/jquery',
  'window.jQuery': 'jquery/src/jquery',
  moment: 'moment',
  Popper: ['popper.js', 'default']
}))
module.exports = environment
