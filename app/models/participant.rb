class Participant < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :project

end
