class SessionsController < ApplicationController

	def new
	end

	def create
		if params[:session][:username]== ENV['USERNAME'] && params[:session][:password]== ENV['PASSWORD'] 
			log_in
			redirect_to root_path
		else
		 	flash.now[:danger] = 'Invalid username/password combination'
		 	render 'new'
		end
	 end

	def destroy
		log_out
		redirect_to root_url
	end

end
