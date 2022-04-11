class Project < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :category
  has_one :return
  has_many :backers, dependent: :destroy
  has_many :participants, dependent: :destroy

  has_one_attached :image

  # enum定義
  enum posting_status: { examination: 0, completed: 1 }


  def b_total_amount
    Backer.all.sum(:support_amount)
  end

  def p_total_amount
    Return.p_amount * Participant.approval_status
  end

end
