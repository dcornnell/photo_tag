class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@new_user = User.new
	end

	def create
		@new_user = User.new(user_params)
		if @new_user.save
			redirect_to homes_path
		else
			redirect_to new_user_path
		end
	end

	


private

 def user_params
 	params.require(:user).permit!
end
end
