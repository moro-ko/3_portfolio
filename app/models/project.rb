class Project < ApplicationRecord
  # アソシエーション
  belongs_to :category
  has_many :returns, dependent: :destroy
  has_many :backers, dependent: :destroy
  has_many :participants, dependent: :destroy

end
