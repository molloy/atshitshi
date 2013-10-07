# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	window.wiselinks = new Wiselinks()

	mapCanvas = $('#map')
	userSearch = $('#user_search')

	$("#search_controls").dialog( { dialogClass: 'no-close' } )
	$(".ui-dialog-titlebar").hide();

	# if (mapCanvas.length > 0)
		# mapOptions =
		# 	zoom: 15,
		# 	mapTypeId: google.maps.MapTypeId.ROADMAP
		# map = new google.maps.Map(mapCanvas.get(0), mapOptions)

		# if navigator.geolocation
		# 	navigator.geolocation.getCurrentPosition (position) ->
		# 		initloc = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
		# 		map.setCenter(initloc)
		# else
		# 	if (request_location)
		# 		new google.maps.Geocoder().geocode { 'address': request_location }, (results, status) ->
		# 			if status == google.maps.GeocoderStatus.OK
		# 				position = results[0].geometry.location
		# 				initloc = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
		# 				map.setCenter(initloc)


	$(window).on 'resize', (e) ->
		uidialog = $("#search_controls").closest('.ui-dialog')
		uidialog_top = $(window).height() - uidialog.height() - 50;
		uidialog.offset( { top: uidialog_top, left: 50 })
		# $("#search_controls").closest('.ui-dialog').offset( { top: $, left: 10 })

	$(window).resize()

	if ($('#user_search').length > 0)
		userSearch = $('#user_search').addresspicker {
			draggableMarker: false,
			regionBias: 'US',
			mapOptions: {
				# disableDefaultUI: true,
				streetViewControl: false
				center: new google.maps.LatLng(36.778261, -119.41793239999998)
				mapTypeControl: false
				# styles: [
				# 	{
				# 		featureType: "poi",
				# 		elementType: "all",
				# 		stylers: [
				# 			{ visibility: "off" }
				# 		]
				# 	}
				# ]
			}
			elements: {
				map: "#map",
				lat: "#lat",
				lng: "#lng",
				street_number: '#street_number',
				route: '#route',
				locality: '#locality',
				administrative_area_level_1: '#administrative_area_level_1',
				administrative_area_level_2: '#administrative_area_level_2',
				country: '#country',
				postal_code: '#postal_code',
				type: '#type'
			}
			updateCallback: (geocodeResult, parsedGeocodeResult) ->
				$.getJSON('/businesses?nelat=' + geocodeResult.geometry.viewport.getNorthEast().lat() +
					'&nelng=' + geocodeResult.geometry.viewport.getNorthEast().lng() +
					'&swlat=' + geocodeResult.geometry.viewport.getSouthWest().lat() +
					'&swlng=' + geocodeResult.geometry.viewport.getSouthWest().lng(),
					(data) ->
						$.each data, (index, biz) ->
							marker = new google.maps.Marker({
								position: new google.maps.LatLng(biz.location[1], biz.location[0]),
								map: $('#user_search').addresspicker('map'),
								title: biz.name
							})
						# $('#geocode').text(JSON.stringify(data))
					)
				# alert geocodeResult.geometry.viewport.northeast
				# alert geocodeResult.geometry.viewport
				# alert geocodeResult.geometry.viewport.southwest
				# $.getJSON('/businesses?' + 'nwlat=' + geocodeResult.geometry.viewport.northeast.lat
		}

		# google.maps.event.addListener userSearchMap, 'idle', (e) ->
		# 	alert 'bounds changed'
