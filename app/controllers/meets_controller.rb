class MeetsController < ApplicationController
	def show
  	@meet=Meet.find(params[:id])
    @comments = @meet.comments
  end

	def destroy
  	meet = Meet.find(params[:id])
  	meet.destroy
  	redirect_to :root
	end

	def new
  	if not current_user
      flash[:notice] = "Please login to create a new meet"
      redirect_to :root
      return
    else
      @meet = Meet.new
    end
	end

	def create
  	meet.create(meet_params)
  	redirect_to :root
	end

	def edit
  	@meet = Meet.find(params[:id])
	end

  def update
    i = Meet.find(params[:id])
    i.update_attributes(meet_params)
    redirect_to :root
  end

	private
  	def meet_params
   		params.require(:Meet).permit(:title, :content, :user_id)
  	end
end
