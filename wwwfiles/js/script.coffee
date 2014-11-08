'use strict'
$(
	->
		window.running = false

		$.get 'img/heart.svg', (data) ->
			$img = $('svg#heart')
			$svg = $(data).find('svg')

			$svg.attr('id', $img.attr('id'))
			$svg.attr('style', $img.attr('style'));
			$img.replaceWith($svg);

		socket = io();
		socket.on 'pulse', (msg) ->
			if window.running
				$('div#rate').text(msg)
				$('svg#heart path').attr('fill', '#DC0057')
				setTimeout ->
					$('svg#heart path').attr('fill', '#E8ECF1')
				, 500

		$('div#control').click ->
			if window.running
				window.running = false
				$('span#button').text("START")
				$('div#rate').text(0)
			else
				window.running = true
				$('span#button').text("STOP")
)
