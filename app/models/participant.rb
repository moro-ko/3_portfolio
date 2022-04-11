class Participant < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :project

  # enum定義
  enum approval_status: { approval: 0, completed: 1 }

  # 参加済みID取得(承認ステータスが承認済み)
  # Participant.approval_status(.count)で取得可
  scope :approval_status, -> { where(approval_status: completed)}

end
