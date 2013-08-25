class MapController < ApplicationController
	before_filter :get_request_location

	def get_request_location
		@user_location = request.location
	end

	def index
		@user_search = params[:user_search]
		unless @user_search.blank? then
			# @user_location = 
		end
	end

	def search
	end
end
