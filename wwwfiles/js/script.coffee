'use strict'
$(
	->
		socket = io();

		socket.on 'pulse', (msg) ->
			$('p#rate').html(msg)
			console.log(msg)
)
