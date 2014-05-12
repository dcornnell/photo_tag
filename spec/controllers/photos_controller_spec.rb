require 'spec_helper.rb'

describe PhotosController do
	describe 'get #index' do
		it 'assign collection of photos' do
			@photos = FactoryGirl.create(:photo)
			get :index
		 	assigns(:photos).count.should eq(1)
		 end
		it 'should render the index page' do
			get :index
			response.should render_template :index
		end
	end
	describe 'get #show' do
		it 'should assign a photo to @photo' do
			@photo = FactoryGirl.create(:photo)
			get :show, id:@photo.id
			@photo.should_not be nil
		end
		it 'should it should render the show page' do
			@photo = FactoryGirl.create(:photo)
			get :show, id:@photo.id
			response.should render_template :show
		end
	end
	describe 'get #new' do
		it 'should assign a new photo to @new_photo' do
			@new_photo = FactoryGirl.create(:photo)
			get :show, id:@new_photo.id
		 	assigns(:photo).should_not be nil
		end
		it 'should render the new page' do
			get :new
			response.should render_template :new
		end
	end
	describe 'post #create' do
		context 'valid post' do
			it 'creates a new photo' do
				photo_attrs = FactoryGirl.attributes_for(:photo)
				expect {
					post :create, photo: photo_attrs
				}.to change(Photo, :count).by(1)
			end
			it 'redirects to index page' do
				get :index
				response.should render_template :index
			end
		end
		context 'invalid post' do
			it 'doesnt create a new photo' do
				photo_attrs = FactoryGirl.attributes_for(:invalid_photo)
				expect {
					post :create, photo: photo_attrs
				}.to change(Photo, :count).by(0)
			end
			it 'redirects to the new page' do
				get :new
				response.should render_template :new
			end
		end
	end
	describe 'get #edit' do
		it 'should assign a photo to @photo' do
			@photo = FactoryGirl.create(:photo)
			get :edit, id:@photo.id
			response.should render_template :edit
		end
		it 'should render the edit page' do
			@photo = FactoryGirl.create(:photo) 
			get :edit , id:@photo.id
			response.should render_template :edit
		end
	end
	describe 'put #update' do
		context 'valid update' do
			before :each do
				@photo =FactoryGirl.create(:photo)
			end
			it 'should update the information' do
				put :update, id: @photo, photo: FactoryGirl.attributes_for(:photo, name: "different name")
				@photo.reload
				@photo.name.should eq("different name")
			end
			it 'should redirect to the index page' do
				get :index
				response.should render_template :index
			end
		end
		context 'invalid update' do 
			before :each do
				@photo =FactoryGirl.create(:photo)
			end
			it 'should not update the information' do
				put :update, id: @photo, photo: FactoryGirl.attributes_for(:photo, name: nil)
				@photo.reload
				@photo.name.should be nil
			end
			it 'should redirect to the page' do
				@photo = FactoryGirl.create(:photo) 
				get :edit , id:@photo.id
				response.should render_template :edit
			end
		end
	end
	describe 'delete #destroy' do 
		before :each do
			@photo =FactoryGirl.create(:photo)
		end
		it 'should remove the photo' do
			expect {
				delete :destroy, id: @photo
			}.to change(Photo, :count).by(-1)
		end
		it 'should redirect the index page' do
			get :index
			response.should render_template :index
		end
	end

end