require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
	test "login with invalid information" do
		get login_path
		assert_template 'sessions/new'
		post login_path, params: {session:{username: "",password: ""}}
		assert_template 'sessions/new'
		assert_not flash.empty?
		get root_path # redirect 
		assert flash.empty?
	end

	test "login with valid information followed by logout" do
		get login_path
		post login_path, params: {session:{username: ENV['USERNAME'],password: ENV['PASSWORD']}}
	    assert is_logged_in?
	    assert_redirected_to root_path #check redirect occur or no
	    follow_redirect!
	    assert_template 'books/home'
	    assert_select "a[href=?]", login_path, count: 0
	    assert_select "a[href=?]", new_path
        assert_select "a[href=?]", logout_path
        delete logout_path
        assert_not is_logged_in?
        assert_redirected_to root_url
        follow_redirect!
        assert_select "a[href=?]", login_path
        assert_select "a[href=?]", new_path,      count: 0
        assert_select "a[href=?]", logout_path,      count: 0


    end

end
