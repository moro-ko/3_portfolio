class Return < ApplicationRecord
  # アソシエーション
  belongs_to :project, optional: :true

  # バリデーション
  validates :b_contents, presence: true, length: { minimum: 1, maximum: 50 }
  validates :p_contents, presence: true, length: { minimum: 1, maximum: 50 }
  validates :p_amount, presence: true

end
