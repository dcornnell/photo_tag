class EventsController < ApplicationController
def index
		@events = Event.all
	end

	def new
		@new_event = Event.new
	end

	def create
		@new_event = Event.new(event_params)
		
	
		

		if @new_event.save
			redirect_to events_path
		else
			redirect_to new_event_path
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(event_params)
			redirect_to events_path
		else
			redirect_to edit_events_path
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_path
	end


private

 def event_params
 	params.require(:event).permit!
 end
 	
end


