class StaticPagesController < ApplicationController
	before_filter :get_request_location
	def get_request_location
		@request_location = request.location
	end

	def home
	end
end
