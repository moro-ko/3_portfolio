class Group < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :project

  has_one_attached :image

  # バリデーション
  validates :name, presence: true
  validates :message, presence: true

end
