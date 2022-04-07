class Category < ApplicationRecord
  # アソシエーション
  has_many :projects, dependent: :destroy

end
