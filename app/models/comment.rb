class Comment < ActiveRecord::Base
	belongs_to :meet
	belongs_to :user
end
