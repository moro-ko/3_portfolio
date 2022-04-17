class Admin::ProjectsController < ApplicationController
  def index
    @projects = Project.all.page(params[:page]).per(4)
    @categories = Category.all
  end

  def examination
    @projects = Project.all.page(params[:page]).per(4)
    @categories = Category.all
  end

  def show
    @project = Project.find(params[:id])
    @returnv = @project.return
    @backers = @project.backers.all
    @participants = @project.participants.where(approval_status: "completed")
    @total_amount = @backers.sum(:support_amount).to_i + (@project.return.p_amount * @participants.count)
    @days_left = @project.end_date - Date.today
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
