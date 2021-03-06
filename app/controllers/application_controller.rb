class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

############ user helpers #####################
def signed_in?
	if !current_user
		flash[:alert] = "Please sign in to view that resource"
		redirect_to new_session_path
	end
end

def sign_in(user)
	session[:user_id] = user.id if user.present?
end

def sign_out
	session[:user_id] = nil
end

def current_user
	@current_user ||= User.find(session[:user_id]) if session[:user_id]
rescue 
	# ActiveRecord::RecordNotFound
	@current_user = nil
	session[:user_id] = nil
end

def current_user?
	current_user.present?
end

def correct_user
	@user = User.find(params[:id])
	if current_user != @user
		flash[:alert] = "That does not belong to you!"
		redirect_to new_session_path :notice => "You need to be signed in to access that page"
    end
end

def admin?
	current_user.admin == true
end


helper_method :current_user
helper_method :current_user?
helper_method :admin?

########## fight helpers #############

# def all_card_fights
# 	@fight = Fight.find(params[:id]) 
# end

# helper_method :all_card_fights

end
