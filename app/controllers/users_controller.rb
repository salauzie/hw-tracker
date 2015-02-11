class UsersController < ApplicationController
	def index
		
	end

	def new
		@user = User.new
	end
	
	def create
		@user = User.create user_params
		redirect_to users_path
	end	

	def edit
		@user = User.find params[:id]
	end

	def update
		@user = User.find params[:id]
		@user.update_attributes user_params
		redirect_to users_path
	end

	def destroy
		@user = User.find params[:id]
		@user.delete
		redirect_to users_path
	end
	
private
	def user_params
		params.require(:user).permit(
			:name,
			:password
		)
	end	

end
