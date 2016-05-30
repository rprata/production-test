class SessionsController < ApplicationController

	def new
		if session[:user_id]
			redirect_to '/admin'
		end
	end

	def create
  		@user = User.find_by_email(params[:session][:email])
	  	if @user && @user.authenticate(params[:session][:password])
	    	session[:user_id] = @user.id
	    	redirect_to '/admin'
	  	else
	    	redirect_to '/admin/login'
	    	flash[:error] = "E-mail and password are wrong. Please, try again."
	  	end 
	end

	def destroy 
    	session[:user_id] = nil 
    	redirect_to '/admin/login' 
	end

end
