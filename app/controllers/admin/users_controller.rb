class Admin::UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    # 支援プロジェクト一覧表示(public/backerへrender)
    backers = Backer.where(user_id: @user.id).pluck(:project_id)
    @backer_projects = Project.find(backers)
    # 参加プロジェクト一覧表示(public/participantへrender)
    participant = Participant.where(user_id: @user.id).pluck(:project_id)
    @participant_projects = Project.find(participant)
    # 投稿プロジェクト一覧表示(public/ownewへrender)
    @owner_projects = Project.where(user_id: @user.id).includes(:user)
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:is_deleted)
  end

end
