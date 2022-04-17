class Category < ApplicationRecord
  # アソシエーション
  has_many :projects, dependent: :destroy

  # バリデーション
  validates :name, presence: true

end
