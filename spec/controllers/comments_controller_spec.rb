require 'spec_helper'

describe CommentsController do
	describe 'Get #new' do
		it 'assings a new comment to @new_comment' do
			@new_comment = FactoryGirl.create(:comment)
		
			@new_comment.should_not be nil
		end
	end

	describe 'Post #create' do
		
		context 'valid comment attributes' do
			it 'creates a new comment' do
				comment_attrs = FactoryGirl.attributes_for(:comment)
				expect {
					post :create, comment: comment_attrs
				}.to change(Event, :count).by(1)
			end

			
		end

		context 'invalid comment attributes' do
			it 'doesnt create a new comment' do
				comment_attrs = FactoryGirl.attributes_for(:invalid_comment)
				expect {
					post :create, comment: comment_attrs
				}.to change(Event, :count).by(0)
			end
		
		end
	end



end