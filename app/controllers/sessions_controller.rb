class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:email].downcase)
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to user, :notice => "Logged in!"
		else
			flash.now[:alert] = "Invalid password"
			render "new"
		end
	end

	def destroy
		sign_out
		redirect_to users_url
	end
end
