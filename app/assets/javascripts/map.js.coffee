# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	window.wiselinks = new Wiselinks()

	mapCanvas = $('#map')
	$("#search_controls").dialog( { dialogClass: 'no-close' } )
	$(".ui-dialog-titlebar").hide();

	if (mapCanvas.length > 0)
		mapOptions =
			zoom: 15,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		map = new google.maps.Map(mapCanvas.get(0), mapOptions)

		if navigator.geolocation
			navigator.geolocation.getCurrentPosition (position) ->
				initloc = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
				map.setCenter(initloc)
		else
			if (request_location)
				new google.maps.Geocoder().geocode { 'address': request_location }, (results, status) ->
					if status == google.maps.GeocoderStatus.OK
						position = results[0].geometry.location
						initloc = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
						map.setCenter(initloc)


	$(window).on 'resize', (e) ->
		uidialog = $("#search_controls").closest('.ui-dialog')
		uidialog_top = $(window).height() - uidialog.height() - 50;
		uidialog.offset( { top: uidialog_top, left: 50 })
		# $("#search_controls").closest('.ui-dialog').offset( { top: $, left: 10 })

	$(window).resize()