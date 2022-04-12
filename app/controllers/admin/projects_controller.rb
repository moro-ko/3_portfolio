class Admin::ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @categories = Category.all
  end

  def examination
    @projects = Project.all
    @categories = Category.all
  end

  def show
    @project = Project.find(params[:id])
    @returnv = Return.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    # binding.pry
    project = Project.find(params[:id])
    project.update(project_params)
    redirect_to admin_projects_path
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to admin_projects_path
  end

  private

  def project_params
    params.require(:project).permit(:posting_status)
  end

end
