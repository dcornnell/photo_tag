class PhotosController < ApplicationController
def index
		@photos = Photo.all
	end

	def new
		@new_photo = Photo.new
	end

	def create
		@new_photo = Photo.new(photo_params)

		if @new_photo.save
			redirect_to photos_path
		else
			redirect_to new_photo_path
		end
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def edit
		@photo = Photo.find(params[:id])
	end

	def update
		@photo = Photo.find(params[:id])
		if @photo.update_attributes(photo_params)
			redirect_to photos_path
		else
			redirect_to edit_photos_path
		end
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		redirect_to photos_path
	end


private

 def photo_params
 	params.require(:photo).permit!
 end
end
