class Catagory < ActiveRecord::Base
	has_many :books ,dependent: :destroy
	validates :name, uniqueness: true, presence: true, format: {with: /\A[a-zA-Z]+\Z/, message: "enter alphabets only"}	
end
