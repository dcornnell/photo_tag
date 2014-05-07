class TagsController < ApplicationController
	def new
		@new_tag = Tag.new
		@photo = Photo.new
	end

	def create
		@new_tag = Tag.new(tag_params)
		@photo = Photo.find(params[:photo_id])
		if @new_tag.save
			@photo.tags << @new_tag
			redirect_to :back
		else
			redirect_to :back
		end
	end

private

	def tag_params
		params.require(:tag).permit!

	end
end