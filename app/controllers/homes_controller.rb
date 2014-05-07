class HomesController < ApplicationController
	def index
		@photos = Photo.all
		@events = Event.all
	end
end

