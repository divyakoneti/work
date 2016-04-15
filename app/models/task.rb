class Task < ActiveRecord::Base
	validates :description, presence: true
    validates :deadline,presence: true
end
