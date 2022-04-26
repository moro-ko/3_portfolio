class Public::GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    project = Project.find(params[:project_id])
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    @group.project_id = project.id
    if @group.save
      flash[:notice] = "グループを作成しました。"
      redirect_to info_project_groups_path(project)
    else
      render :new
    end
  end

  def info
    @project = Project.find(params[:project_id])
    @group = @project.group
    # binding.pry
    # @groups = project.groups.all
  end

  def show
    @project = Project.find(params[:project_id])
    @group = Group.find(params[:id])
  end

  def edit
    @project = Project.find(params[:project_id])
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "グループ情報を更新しました。"
      redirect_to project_group_path(@group)
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :message, :image)
  end

end
