class Public::ReturnsController < ApplicationController
  def new
    @returnv = Return.new
  end

  def create
    # binding.pry
    project = Project.find(params[:project_id])
    @returnv = Return.new(returnv_params)
    @returnv.project_id = project.id
    if @returnv.save
      flash[:notice] = "プロジェクト内容を申請しました。"
      # redirect_to project_path(@returnv)
      redirect_to owner_users_path(current_user)
    else
      render :new
    end
    # returnv = Return.new(returnv_params)
    # returnv.save
    # returnv.project_id = returnv.id
    # returnv.save
    # redirect_to projects_path
    # binding.pry
  end

  def index
     @returnvs = Return.all
  end

  def show
    @returnv = Return.find(params[:id])
  end

  def edit
    @returnv = Return.find(params[:id])
  end

  def update
    @returnv = Return.find(params[:id])
    if @returnv.update(returnv_params)
      flash[:notice] = "プロジェクト内容が変更されました"
      redirect_to project_path(@returnv)
    else
      render :edit
    end
  end

  def selects
    @project = Project.find(params[:project_id])
  end

  private

  def returnv_params
    params.require(:return).permit(:b_contents, :p_contents, :p_amount)
  end
end
