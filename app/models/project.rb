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

end
