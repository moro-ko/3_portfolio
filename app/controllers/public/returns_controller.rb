class Public::ReturnsController < ApplicationController
  def new
    @returnv = Return.new
  end

  def create
    # binding.pry
    project = Project.find(params[:project_id])
    returnv = Return.new(returnv_params)
    returnv.project_id = project.id
    returnv.save
    redirect_to projects_path
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
    returnv = Return.find(params[:id])
    returnv.update(returnv_params)
    redirect_to projects_path
  end

  def selects
    @project = Project.find(params[:project_id])
  end

  private

  def returnv_params
    params.require(:return).permit(:b_contents, :p_contents, :p_amount)
  end
end
