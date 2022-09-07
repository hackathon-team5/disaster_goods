process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

module.exports = {
  module:{
    rules:[
        {
            test:/\.scss$/,
            use:['style-loader','css-loader','sass-loader']
        }
     ]
    }
  }
