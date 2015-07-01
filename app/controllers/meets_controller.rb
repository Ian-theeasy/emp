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

  def find_place
    if not current_user
      flash[:notice] = "Please login to create a new meet"
      redirect_to :root
      return
    end
    if params[:placename]!=nil
      @search_failed=true
    end
  end

	def new
    if params[:placename]!=nil || cookies[:place_id]!=nil
        if Place.exists?(:name => params[:placename])
          cookies[:place_id]=Place.find_by(:name => params[:placename]).id
        else
          cookies[:place_id]=nil
          render :find_place
        end
      else
        render :find_place
      end

  	if not current_user
      flash[:notice] = "Please login to create a new meet"
      redirect_to :root
      return
    else
      @meet = Meet.new
      @gid= params[:gid]
      @place= Place.find_by(name: params[:placename])
    end
	end

	def create
  	 @meet=Meet.new(meet_params)
    if @meet.save
      redirect_to meet_path(@meet.id)
    else
      render :new
    end

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
   		params.require(:meet).permit(:title, :content, :user_id, :group_id, :place_id, :start_date, :start_time)
  	end
end
