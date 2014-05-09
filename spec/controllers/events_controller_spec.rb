require 'spec_helper'

describe EventsController do
	
	describe 'Get #index' do
		it 'assign collection of events' do
		 FactoryGirl.create(:event)
		 get :index
		 assigns(:events).count.should eq(1)
		end
		it 'render index page' do
			get :index
			response.should render_template :index
		end
	end
	
	describe 'Get #show' do
		it 'assign an event to @event' do
			@event = FactoryGirl.create(:event) 
			get :show, id:@event.id
			@event.should_not be nil
		end
		it 'renders the show page' do
		 	@event = FactoryGirl.create(:event) 
		 	get :show, id:@event.id
		 	response.should render_template :show
		end
	end

	describe 'Get #new' do
		it 'assings a new event to @new_event' do
			@new_event = FactoryGirl.create(:event)
			get :show, id:@new_event.id
			@new_event.should_not be nil
		end
		it 'renders the new page' do
			get :new
			response.should render_template :new
		end
	end

	describe 'Post #create' do
		
		context 'valid event attributes' do
			it 'creates a new event' do
				event_attrs = FactoryGirl.attributes_for(:event)
				expect {
					post :create, event: event_attrs
				}.to change(Event, :count).by(1)
			end

			it 'redirects to the index page' do
				get :index
				response.should render_template :index
			end
		end
		
		context 'invalid event attributes' do
			it 'doesnt create a new event' do
				event_attrs = FactoryGirl.attributes_for(:invalid_event)
				expect {
					post :create, event: event_attrs
				}.to change(Event, :count).by(0)
			end
			it 'redirects to the new event page' do
				get :new
				response.should render_template :new
			end
		end
	end

	describe 'Get #edit' do
		it 'retrieves the event that is going to be edited' do
			@event = FactoryGirl.create(:event) 
			get :show, id:@event.id
			@event.should_not be nil
		end


		it 'should render the edit page' do
			@event = FactoryGirl.create(:event) 
			get :edit , id:@event.id
			response.should render_template :edit
		end
	end
	describe 'Put #update'
		
		context 'valid update' do
			before :each do
				@event =FactoryGirl.create(:event)
			end
			it 'should update the information' do
				put :update, id: @event, event: FactoryGirl.attributes_for(:event, name: "Name Change")
				@event.reload
				@event.name.should eq("Name Change")
			end
			it 'should redirect to the index page' do
				get :index
				response.should render_template :index
			end
		end
		context 'invalid update' do 
			before :each do
				@event =FactoryGirl.create(:event)
			end
			it 'should not update the information' do
				put :update, id: @event, event: FactoryGirl.attributes_for(:event, name: nil)
				@event.reload
				@event.name.should eq("John Doe")
			end
			it 'should redirect to the page' do
				@event = FactoryGirl.create(:event) 
				get :edit , id:@event.id
				response.should render_template :edit
			end
		end
	describe 'Delete #destroy' do
		before :each do
			@event =FactoryGirl.create(:event)
		end
		it 'should remove the event' do
			expect {
				delete :destroy, id: @event
			}.to change(Event, :count).by(-1)
		end
		it 'should redirect the index page' do
			get :index
			response.should render_template :index
		end
	end
end
