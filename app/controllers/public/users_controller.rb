class Public::UsersController < ApplicationController

  def backer
    user = current_user
    backers = Backer.where(user_id: user.id).pluck(:project_id)
    @backer_projects = Project.find(backers)
  end

  def participant
    user = current_user
    participants = Participant.where(user_id: user.id).pluck(:project_id)
    @participant_projects = Project.find(participants)
  end

  def owner
    user = current_user
    @owner_projects = Project.where(user_id: user.id).includes(:user)
  end

  def favorite
    user = current_user
    favorite = Favorite.where(user_id: user.id).pluck(:project_id)
    @favorite_projects = Project.find(favorite)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.email == 'guest@example'
      flash[:alert] = "ゲストユーザは編集できません"
      redirect_to root_path
    else
      if @user.update(user_params)
        flash[:notice] = "ユーザ情報を更新しました"
        redirect_to users_my_page_path
      else
        render :edit
      end
    end
  end

  def withdraw
    user = current_user
    if user.email == 'guest@example'
      flash[:alert] = "ゲストユーザは退会できません"
      redirect_to root_path
    else
      # is_deletedカラムをtrueに変更することにより削除フラグを立てる
      user.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :image, :is_deleted)
  end

end


# メモーーーーー

  # 支援プロジェクト一覧
    # renderなしの場合に使用
      # def backer
      #   user = current_user
      #   backers = Backer.where(user_id: user.id).pluck(:project_id)
      #   @backer_projects = Project.find(backers)
      # end
    # /backerへrender
      # backers = Backer.where(user_id: user.id).pluck(:project_id)
      # @backer_projects = Project.find(backers)
    # backers/indexへrender
      # user = current_user
      # @user_backers = user.backers

  # def show
    # 共通
      # user = current_user
    # 支援プロジェクト一覧表示(/backerへrender)
      # backers = Backer.where(user_id: user.id).pluck(:project_id)
      # @backer_projects = Project.find(backers)
        # ↓支援プロジェクト一覧表示(backers/indexへrender)
          # user = current_user
          # @user_backers = user.backers
    # 参加プロジェクト一覧表示(participantへrender)
      # participant = Participant.where(user_id: user.id).pluck(:project_id)
      # @participant_projects = Project.find(participant)
    # 投稿プロジェクト一覧表示(ownewへrender)
      # @owner_projects = Project.where(user_id: current_user.id).includes(:user)
  # end
