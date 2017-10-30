require 'test_helper'

class BooksEditTest < ActionDispatch::IntegrationTest

	def setup
		@book= books(:cats)
	end

	test "unsuccessful add book" do
		is_log_in
		get new_path
		assert_template 'books/new'
		assert_no_difference 'Book.count' do
		post books_path , params: {book:{title: "",publisher: "",isbn: "", date: 20/3/2003}}
	end
		assert_template 'books/new'

	end

	test "successful add book" do
		is_log_in
		get new_path
		assert_template 'books/new'
        assert_difference 'Book.count', 1 do
        	post books_path ,  params: {book:{title: "hands",publisher: "hend",isbn: "fdsf4",publishing_date:"20-3-2007"}}
		end
		follow_redirect!
		assert_template 'books/show'
	end

	test "unsuccessful edit book" do
		 is_log_in
		 get edit_book_path(@book)
		 assert_template 'books/edit'
		 patch book_path(@book), params: {book:{title: "",publisher: "",isbn: ""}}
		 assert_template 'books/edit'

	end

	test "successful edit book" do
		is_log_in
		get edit_book_path(@book)
		assert_template 'books/edit'
		title = "chicken"
		patch book_path params: {book: {title: title }}
		assert_not flash.empty?
    	assert_redirected_to @book
        @book.reload
        assert_equal title,  @book.title
	end

	test "should redirect destroy when not logged in" do
		assert_no_difference 'Book.count' do
		delete book_path(@book)
		end
		assert_redirected_to login_url
	end

	test "should delete as admin" do
		is_log_in

		#assert_Select 'a[href=?]',
		#assert_Select 'a[href=?]',
		#assert_Select 'a[href=?]',
    end

end
