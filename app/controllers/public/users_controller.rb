class Public::UsersController < ApplicationController
  def show
    # 共通
    user = current_user
    # 支援プロジェクト一覧表示(/backerへrender)
    backers = Backer.where(user_id: user.id).pluck(:project_id)
    @backer_projects = Project.find(backers)
      # ↓支援プロジェクト一覧表示(backers/indexへrender)
      # user = current_user
      # @user_backers = user.backers
    # 参加プロジェクト一覧表示(participantへrender)
    participant = Participant.where(user_id: user.id).pluck(:project_id)
    @participant_projects = Project.find(participant)
    # 投稿プロジェクト一覧表示(ownewへrender)
    @owner_projects = Project.where(user_id: current_user.id).includes(:user)
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to users_my_page_path
  end

  def withdraw
    user = current_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :image, :is_deleted)
  end

end


# メモーーーーー

  # 支援プロジェクト一覧renderなしの場合に使用
  # def backer
  #   user = current_user
  #   backers = Backer.where(user_id: user.id).pluck(:project_id)
  #   @backer_projects = Project.find(backers)
  # end
