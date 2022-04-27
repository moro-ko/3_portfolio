class Public::ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    # binding.pry
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      redirect_to new_project_return_path(@project)
    else
      render :new
    end
  end

  def index
    # @projects = Project.where(posting_status: "completed").page(params[:page]).per(4)
    @categories = Category.all
    if params[:id]
      @category = Category.find(params[:id])
      @projects = @category.projects.where(posting_status: "completed").page(params[:page]).per(4)
    else
      @projects = Project.where(posting_status: "completed").page(params[:page]).per(4)
    end
  end

  def show
    @project = Project.find(params[:id])
    @returnv = @project.return
    @backers = @project.backers.all
    @participants = @project.participants.where(approval_status: "completed")
    @total_amount = @backers.sum(:support_amount).to_i + (@project.return.p_amount * @participants.count)
    @achievement_rate = @total_amount.quo(@project.target_amount).to_f * 100
    @days_left = @project.end_date - Date.today
    @group = @project.group
    # binding.pry
    # 支援総額表示
    # b_total_amount = Backer.where(:project_id).sum(:support_amount)
    # p_total_amount = ( Participant.approval_status.count.to_i * @returnv.p_amount )
    # 支援者数表示(backer,participant ※approval_status:participant.rbに定義)
    # 上記@backers,@participantsと同意
    # @backers = Backer.where(project_id: @project.id)
    # @participants = Participant.where(project_id: @project.id, approval_status: "completed")
  end

  def edit
    @project = Project.find(params[:id])
    if @project.user == current_user
      render :edit
    else
      redirect_to project_path(@project)
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to edit_project_return_path(@project)
    else
      render :edit
    end
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
    params.require(:project).permit(:target_amount, :end_date, :title, :content, :category_id, :area, :image)
  end

end
