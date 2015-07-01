class GroupsController < ApplicationController
	def index
		@groups= Group.all
	end
	def show
		@group= Group.find(params[:id])
		if current_user
			@joining = Joining.find_by(group_id: params[:id],user_id: current_user.id)
		end
		@user_list= Joining.where(group_id: params[:id])
		@meets=Meet.where(group_id:params[:id])
	end

	def new
		if not current_user
      flash[:notice] = "Please login to create a new group"
      redirect_to :groups
      return
    else
      @group = Group.new
    end
	end

	def create
		Group.create(group_params)
  	redirect_to :groups
	end

	def destroy
  	group = Group.find(params[:id])
  	group.destroy
  	redirect_to :groups
	end

	def edit
  	@group = Group.find(params[:id])
	end

	def update
    group = Group.find(params[:id])
    group.update_attributes(group_params)
    redirect_to group_path(params[:id])
  end

	private
  	def group_params
   		params.require(:group).permit(:name, :description)
  	end
end
