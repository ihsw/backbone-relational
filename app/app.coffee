express = require 'express'
jade = require 'jade'
bodyParser = require 'body-parser'
redis = require 'redis'
async = require 'async'

client = redis.createClient()
app = express()
app.use bodyParser.json()
app.set 'view engine', 'jade'
app.set 'views', __dirname + '/views'
app.locals.pretty = true

app.use '/', express.static './dist'
app.get '/', (req, res) -> res.render 'index'
app.get '/phones', (req, res) ->
  client.smembers 'phone_ids', (err, ids) ->
    async.map(
      ids,
      (id, callback) -> client.get "phone:#{id}", (err, data) ->
        callback null, JSON.parse data
      (err, results) -> res.json results
    )
app.post '/phone', (req, res) ->
  client.incr 'phone_id', (err, id) ->
    phone = req.body
    phone.id = id
    client.set "phone:#{id}", JSON.stringify req.body
    client.sadd 'phone_ids', id
    res.json({ id: id })
app.delete '/phone/:id', (req, res) ->
  id = req.params.id
  client.del "phone:#{id}"
  client.srem 'phone_ids', id
  res.end()
app.listen 80
