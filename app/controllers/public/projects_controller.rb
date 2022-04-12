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
    # binding.pry
    @project = Project.find(params[:id])
    @returnv = @project.return
    # 支援総額表示
    # b_total_amount = Backer.where(:project_id).sum(:support_amount)
    # p_total_amount = ( Participant.approval_status.count.to_i * @returnv.p_amount )
    # @total_amount = (b_total_amount + p_total_amount)
    # 支援者数表示(backer,participant ※approval_status:participant.rbに定義)
    backer = Backer.where(project_id: @project.id).pluck(:id)
    @b_number = Backer.find(backer)
    # participant = Participant.where(project_id: @project.id).pluck(:id)
    # p_number = Participant.approval_status
    # @p_number = (participant.id && p_number)
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
