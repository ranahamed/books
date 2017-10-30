class Book < ApplicationRecord
	  before_save { self.title = title.downcase }
	valid_date_regex= /\d{4}(\.|-)\d{2}(\.|-)\d{2}/
	has_many :authors , dependent: :destroy
	accepts_nested_attributes_for :authors , allow_destroy: true
	validates :title ,presence: true ,length: {maximum: 50},uniqueness: { case_sensitive: false }
	validates :publisher ,presence: true ,length: {maximum: 50}
	validates :isbn ,presence: true,length: {maximum: 20},uniqueness: { case_sensitive: false }
	validates :publishing_date, presence: true,format: {with: valid_date_regex}

	def self.searchpublisher(search)
     where("publisher LIKE ?", "%#{search}%") 
   end

   def self.searchtitle(search)
     where("title LIKE ?", "%#{search}%") 
   end
  def self.searchauthor(search)
  	Book.joins(:authors)
          .where("authors.name LIKE ?", "%#{search}%")
         
   end

end
