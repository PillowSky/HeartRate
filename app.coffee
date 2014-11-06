'use strict'
express = require('express')
app = express()
http = require('http').Server(app)
io = require('socket.io')(http)

io.on 'connection', (socket) ->
	console.log('a user connected')

	socket.on 'disconnect', ->
		console.log('user disconnected')

app.use(express.static(__dirname + '/wwwfiles'))

app.get '/pulse', (req, res) ->
	if req.query.rate?
		res.status(200).end()
		io.emit('pulse', req.query.rate)
		console.log(req.query.rate)
	else
		res.status(500).end()

http.listen 4000, ->
	console.log('listening on *:4000')

