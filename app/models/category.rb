class Category < ApplicationRecord
  # アソシエーション
  has_many :projects, dependent: :destroy

  # バリデーション
  validates :name, presence: true, length: { minimum: 1, maximum: 15 }

end
