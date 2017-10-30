module SessionsHelper
	def log_in 
		session[:login]=true
	end

	def logged_in?
		session[:login]
	end

	def log_out
		session.delete(:username)
		session.delete(:password)
		session[:login]= false
	end
end
