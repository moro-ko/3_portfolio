class Public::ParticipantsController < ApplicationController
  def new
    @participant = Participant.new
    @project = Project.find(params[:project_id])
  end

  def log
    @project = Project.find(params[:project_id])
    @participant = Participant.new(participant_params)
    @participants = Participant.all
  end

  def create
    @project = Project.find(params[:project_id])
    participant = Participant.new(participant_params)
    participant.user_id = current_user.id
    participant.project_id = @project.id
    participant.save
    redirect_to complete_project_participants_path
  end

  def complete
  end

  def index
    # project_idに紐づくparticipantデータの取得(.allは必須でない)
    @project = Project.find(params[:project_id])
    @participants = @project.participants.all
    @returnv = @project.return
  end

  def edit
    # project_idに紐づく特定participantデータの取得
    project = Project.find(params[:project_id])
    participants = project.participants
    @participant = participants.find(params[:id])
  end

  def update
    participant = Participant.find(params[:id])
    participant.update(participant_params)
    redirect_to project_participants_path
  end

  private

  def participant_params
    params.require(:participant).permit(:reason, :contact_address, :comment, :approval_status)
  end

end
