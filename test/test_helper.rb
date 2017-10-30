require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def is_logged_in?
  	session[:login]
  end

  def is_log_in 
  	get  login_path
  	post login_path, params: {session:{username: ENV['USERNAME'],password: ENV['PASSWORD']}}
	session[:login]=true
  end

  # Add more helper methods to be used by all tests here...
end

