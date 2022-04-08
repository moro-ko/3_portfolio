class Return < ApplicationRecord
  # アソシエーション
  belongs_to :project, optional: :true

end
