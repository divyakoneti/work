class Book < ActiveRecord::Base
	belongs_to :catagory
	belongs_to :user
	validates :book_title, presence: true, uniqueness: { scope: :catagory_id , message: "book already exists" }
    validates :catagory_id ,presence: true
end
