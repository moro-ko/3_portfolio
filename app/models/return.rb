class Return < ApplicationRecord
  # アソシエーション
  belongs_to :project, optional: :true

  # バリデーション
  validates :b_contents, presence: true
  validates :p_contents, presence: true
  validates :p_amount, presence: true

end
