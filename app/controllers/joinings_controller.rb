class JoiningsController < ApplicationController
	def destroy
  	@joining = Joining.find(params[:id])
  	@joining.destroy
  	redirect_to :groups
	end

	def create
		Joining.create(user_id: params[:user_id], group_id: params[:group_id])
  	redirect_to group_path(params[:group_id])
	end

end
