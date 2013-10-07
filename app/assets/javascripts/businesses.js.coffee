# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	if ($('#business_address_picker').length > 0)
		userSearch = $('#business_address_picker').addresspicker {
			draggableMarker: false,
			regionBias: 'US',
			elements: {
				# map: "#map",
				lng: "#business_lng",
				lat: "#business_lat",
				street_number: '#business_street_number',
				route: '#business_street_name',
				locality: '#business_city',
				administrative_area_level_1: '#business_state',
				administrative_area_level_2: '#business_county',
				postal_code: '#business_postal_code'
				country: '#business_country'
			}
		}

		# initloc = new google.maps.LatLng(36.778261, -119.41793239999998)
		# userSearch.addresspicker('map').setCenter(initloc)
