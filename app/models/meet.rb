class Meet < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user
	belongs_to :group
end
