require 'spec_helper'

describe Event do
	describe 'Get #index' do
		it 'should render index page'
		it 'assigne collection of events'
	end
	
	describe 'Get #show' do
		it 'assign an event to @event'
		it 'renders the show page'
	end

	describe 'Get #new' do
		it 'assings a new event to @new_event'
		it 'renders the new page'
	end

	describe 'Post #create' do
		context 'valid event attributes' do
			it 'creates a new event'
			it 'redirects to the index page'
		end
		context 'invalid event attributes' do
			it 'doesnt create a new event' 
			it 'redirects to the new event page'
		end
	end

	describe 'Get #edit' do
		it 'shows the event that is going to be edited'
		it 'should render the edit page'
	end
	describe 'Put #update'
		context 'valid update' do
			it 'should update the information'
			it 'shuold redirect to the index page'
		end
		context 'invalid update' do 
			it 'should not update the information'
			it 'should recirect to the edit page'
		end
	describe 'Delete #destroy' do
		it 'should remove the event'
		it 'should render the index page'
	end
end
