'use strict'
express = require('express')
app = express()
http = require('http').Server(app)
io = require('socket.io')(http)

app.use(express.static(__dirname + '/wwwfiles'))

app.get '/pulse', (req, res) ->
	if req.query.rate?
		res.status(200).end()
		io.emit('pulse', req.query.rate)
	else
		res.status(500).end()

http.listen 4000, ->
	console.log('Listening on *:4000')
