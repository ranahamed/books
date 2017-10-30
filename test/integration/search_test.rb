require 'test_helper'

class SearchTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
		@book= books(:cats)
		@author= books(:cats)

	end

  test "search as admin" do
  	is_log_in
  	get search_path
  	assert_template 'books/search'
  	post search_index_path, params:  {search: "cats"}
  	#assert_select book_path(@book)
  	#assert_select @book_path
    assert_select "a[href=?]", edit_book_path(@book),      count: 1
    #assert_select "a[href=?]", delete_book_path(@book) ,     count: 1
 
  end


  test "search as non admin" do
  	get search_path
  	assert_template 'books/search'
  	post search_index_path, params:  {search: "cats"}
    #assert_select "result"
    #assert_select book_path(@book)
  	assert_select "a[href=?]", edit_book_path(@book),      count: 0
  	#assert_select "a[href=?]", delete_book_path(@book) ,     count: 0
  end

end
