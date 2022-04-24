class Project < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :category
  has_one :return
  has_many :backers, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  # enum定義
  enum posting_status: { examination: 0, completed: 1 }

  # 検索機能
  def self.search(keyword)
    where(["title like? OR content like?", "%#{keyword}%", "%#{keyword}%"])
  end

  # いいね機能
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 支援機能
    # 後援者
  def backed_by?(user)
    backers.exists?(user_id: user.id)
  end
    # 参加者（参加済み）
  def parted_by?(user)
    participants.where(approval_status: "completed").exists?(user_id: user.id)
  end
    # 参加者（申請中）
  def parting_by?(user)
    participants.where(approval_status: "approval").exists?(user_id: user.id)
  end

  # バリデーション
  validates :target_amount, presence: true
  validates :end_date, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true

end
