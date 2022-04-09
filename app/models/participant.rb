class Participant < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :project

  # enum定義
  enum approval_status: { approval: 0, completed: 1 }
end
