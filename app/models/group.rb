class Group < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :project

  has_one_attached :image

  # バリデーション
  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :message, presence: true, length: { minimum: 1, maximum: 200 }

end
