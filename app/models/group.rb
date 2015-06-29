class Group < ActiveRecord::Base
	has_many :users, through: :joinings
	has_many :meets
end
