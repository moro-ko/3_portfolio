class Backer < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :project

  # バリデーション
  validates :support_amount, presence: true
  validates :comment, presence: true

end
