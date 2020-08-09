const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const Dotenv = require('dotenv-webpack');

module.exports = {
  entry: ['./javascript/app.js', './stylesheets/style.scss'],
  output: {
    path: path.resolve(__dirname, 'public'),
    filename: 'app.js'
  },
  module: {
    rules: [{
      test: /\.(sass|scss)$/,
      use: [
        "style-loader",
        {
          loader: MiniCssExtractPlugin.loader,
          options: {
              hmr: process.env.NODE_ENV === 'development'
          }
        },
        "css-loader",
        "sass-loader"
      ]
    }]
  },
  plugins: [
    new Dotenv(),
    new MiniCssExtractPlugin({
        filename: 'style.css'
    })
  ]
};