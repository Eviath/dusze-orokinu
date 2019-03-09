const webpack = require('webpack');
const {environment} = require('@rails/webpacker');


environment.plugins.append('Provide', new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default'],
}));

environment.plugins.prepend(
    'MomentContextReplacement',
    new webpack.ContextReplacementPlugin(/moment[\/\\]locale$/, /en|pl/)
);


module.exports = environment;