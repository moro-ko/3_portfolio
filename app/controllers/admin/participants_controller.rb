class Admin::ParticipantsController < ApplicationController
  def index
    # project_idに紐づくparticipantデータの取得(.allは必須でない)
    project = Project.find(params[:project_id])
    @participants = project.participants.all
  end
end
