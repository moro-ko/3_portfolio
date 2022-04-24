class Public::BackersController < ApplicationController
  def new
    @backer = Backer.new
  end

  def log
    @backer = Backer.new(backer_params)
    @backers = Backer.all
  end

  def create
    project = Project.find(params[:project_id])
    @backer = Backer.new(backer_params)
    @backer.user_id = current_user.id
    @backer.project_id = project.id
    if @backer.save
      redirect_to complete_project_backers_path
    else
      render :new
    end
  end

  def complete
  end

  def index
    # project_idに紐づくbackerデータの取得(.allは必須でない)
    @project = Project.find(params[:project_id])
    @backers = @project.backers.all
    @participants = @project.participants.where(approval_status: "completed")
    @total_amount = @backers.sum(:support_amount).to_i + (@project.return.p_amount * @participants.count)
    @achievement_rate = @total_amount.quo(@project.target_amount).to_f * 100
    @days_left = @project.end_date - Date.today
    @returnv = @project.return
  end

  private

  def backer_params
    params.require(:backer).permit(:support_amount, :comment)
  end

end
