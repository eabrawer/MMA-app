class UsersController < ApplicationController
  before_filter :signed_in?, :only => [:edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update, :destroy]
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to users_url, :notice => "Your account was successfully created!"
  	else
  		render 'new'
      flash.now[:alert] = "User was not created"
  	end
  end

  def edit
  end

  def update
  	if @user.update_attributes(user_params)
  		redirect_to user_path(@user), :notice => "Your account was successfully updated!"
  	else
  		render 'edit'
      flash.now[:alert] = "Your account was not updated!"
  	end
  end

  def destroy
  	@user.destroy
  	redirect_to users_path, :notice => "Your account was successfully deleted!"
  end

  private

  def user_params
  	params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end



end
