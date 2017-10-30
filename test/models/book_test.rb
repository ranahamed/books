require 'test_helper'

class BookTest < ActiveSupport::TestCase

def setup
	@book=Book.new(title: "example", publisher: "example publisher", isbn: "example1", publishing_date: "2003-02-03")
end

test "should be valid" do
	assert @book.valid?
end

test "title should be present" do
	@book.title= "  "
	assert_not @book.valid?
end


test "isbn should be present" do
	@book.isbn= "  "
	assert_not @book.valid?
end

test "publisher should be present" do
	@book.publisher= "  "
	assert_not @book.valid?
end

test "title shouldn't be too long" do
	@book.title="a"*51
	assert_not @book.valid?
end

test "publisher shouldn't be too long" do
	@book.publisher="a"*51
	assert_not @book.valid?
end

test "isbn shouldn't be too long" do
	@book.isbn="a"*21
	assert_not @book.valid?
end



test "publishing date format should be valid" do
	valid_dates = %w[2003-1-2 2003/2/6 1990.3.6]
    valid_dates.each do |valid_date|
      @book.publishing_date = valid_date
      assert @book.valid?, "#{valid_date.inspect} should be valid"
    end
  end

 test "title should be unique" do
 	dup_book=@book.dup
 	@book.save
 	assert_not dup_book.valid?
 end

 test "isbn should be unique" do
 	dup_book=@book.dup
 	@book.save
 	assert_not dup_book.valid?
 end

#test "should reject invalid date" do
	#invalid_dates = %w[2003+1+2 20032/6 1990/36]
   # invalid_dates.each do |invalid_date|
     # @book.publishing_date = invalid_date
     # assert_not @book.valid?, "#{invalid_date.inspect} should be invalid"
    #end
  #end



end
