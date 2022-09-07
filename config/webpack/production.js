process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

module.exports = {
    entry: {
        entry: 'app/javascript/packs/application.js'
      },
  module:{
    rules:[
        {
            test:/\.scss$/,
            use:['style-loader','css-loader','sass-loader']
        }
     ]
    }
  }
