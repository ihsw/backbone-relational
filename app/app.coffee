express = require 'express'
jade = require 'jade'

app = express()
app.set 'view engine', 'jade'
app.set 'views', __dirname + '/views'
app.locals.pretty = true

app.use '/', express.static './dist'
app.get '/', (req, res) -> res.render 'index'
app.listen 80
