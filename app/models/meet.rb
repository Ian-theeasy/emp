class Meet < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user
	belongs_to :group
	belongs_to :place

	# title validates
	validates_presence_of :title, :message => "Please input a meet title"
	validates_length_of :title, :in => 1..20, :message => "title length must be less than 20"

	validate :date_cannot_be_in_the_past

	def date_cannot_be_in_the_past
		if start_date.present? && start_date < Date.today
			errors.add(:start_date, "must be a future date")
		end
	end

end
