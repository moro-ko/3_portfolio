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
    @participant = Participant.new(participant_params)
    @participant.user_id = current_user.id
    @participant.project_id = @project.id
    if @participant.save
      redirect_to complete_project_participants_path
    else
      render :new
    end
  end

  def complete
  end

  def index
    # project_idに紐づくparticipantデータの取得(.allは必須でない)
    @project = Project.find(params[:project_id])
    @backers = @project.backers.all
    @participants = @project.participants.where(approval_status: "completed")
    @participant_all = @project.participants.all
    @total_amount = @backers.sum(:support_amount).to_i + (@project.return.p_amount * @participants.where(approval_status: "completed").count)
    @achievement_rate = @total_amount.quo(@project.target_amount).to_f * 100
    @days_left = @project.end_date - Date.today
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
