class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcom to the TravelAsk!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def new
		@user = User.new
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
