class UsersController < ApplicationController

	def index
		if current_user==nil then redirect_to '/signin'; return end
		@users = User.all		
	end	
	
	def show
		@user = User.find(params[:id])
		@questions = Question.where(user_id: @user.id)
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to TravelAsk!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def new
		@user = User.new
	end


def edit
    @user = User.find(params[:id])
  end
  
  
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to '/'
    else
      render 'edit'
    end
  end

  
	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
	
	
	
end
