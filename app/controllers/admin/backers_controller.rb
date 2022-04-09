class Admin::BackersController < ApplicationController
  def index
    # project_idに紐づくbackerデータの取得(.allは必須でない)
    project = Project.find(params[:project_id])
    @backers = project.backers.all
  end
end
