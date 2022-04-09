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
    backer = Backer.new(backer_params)
    backer.user_id = current_user.id
    backer.project_id = project.id
    backer.save
    redirect_to complete_project_backers_path
  end

  def complete
  end

  def index
    # project_idに紐づくbackerデータの取得(.allは必須でない)
    project = Project.find(params[:project_id])
    @backers = project.backers.all
  end

  private

  def backer_params
    params.require(:backer).permit(:support_amount, :comment)
  end

end
