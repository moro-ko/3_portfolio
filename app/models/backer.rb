class Backer < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :project


  def b_total_amount
    Backer.all.sum(:support_amount)
  end

end
