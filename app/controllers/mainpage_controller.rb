class MainpageController < ApplicationController
	def index
		@meets  = Meet.all.reverse
	end

	def about
	end

end
