express = require 'express'
jade = require 'jade'
bodyParser = require 'body-parser'
redis = require 'redis'

client = redis.createClient()
app = express()
app.use bodyParser.json()
app.set 'view engine', 'jade'
app.set 'views', __dirname + '/views'
app.locals.pretty = true

app.use '/', express.static './dist'
app.get '/', (req, res) -> res.render 'index'
app.post '/phone', (req, res) ->
  client.incr 'phone_id', (err, id) ->
    client.set "phone:#{id}", JSON.stringify req.body
    res.json({ id: id })
app.listen 80
