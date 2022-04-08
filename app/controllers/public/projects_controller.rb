class Public::ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    # binding.pry
    project = Project.new(project_params)
    project.user_id = current_user.id
    project.save
    redirect_to new_return_path
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @returnv = Return.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    project = Project.find(params[:id])
    project.update(project_params)
    redirect_to edit_return_path
  end

  private

  def project_params
    params.require(:project).permit(:target_amount, :end_date, :title, :content, :category_id, :image)
  end

end
