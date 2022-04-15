class Public::ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    # binding.pry
    project = Project.new(project_params)
    project.user_id = current_user.id
    project.save
    redirect_to new_project_return_path(project)
  end

  def index
    @projects = Project.all
    @categories = Category.all
  end

  def show
    @project = Project.find(params[:id])
    @returnv = @project.return
    # 支援総額表示
    # b_total_amount = Backer.where(:project_id).sum(:support_amount)
    # p_total_amount = ( Participant.approval_status.count.to_i * @returnv.p_amount )
    # 支援者数表示(backer,participant ※approval_status:participant.rbに定義)
    # @backers = Backer.where(project_id: @project.id)
    @backers = @project.backers.all
    # @participants = Participant.where(project_id: @project.id, approval_status: "completed")
    @participants = @project.participants.where(approval_status: "completed")
    @total_amount = @backers.sum(:support_amount).to_i + (@project.return.p_amount * @participants.count)
    @days_left = @project.end_date - Date.today
    # binding.pry

  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    project = Project.find(params[:id])
    project.update(project_params)
    redirect_to edit_project_return_path(project)
  end

  def search
    if params[:keyword].present?
      @projects = Project.where('title LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @projects = Project.all
    end
  end

  private

  def project_params
    params.require(:project).permit(:target_amount, :end_date, :title, :content, :category_id, :image)
  end

end
