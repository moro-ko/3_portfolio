class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:name]

  # アソシエーション
  has_many :projects, dependent: :destroy
  has_many :backers, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :groups, dependent: :destroy

  has_one_attached :image

  # バリデーション
  validates :name, presence: true
  validates :email, presence: true

  # ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないよう制約をかける
  # is_deletedがfalseならtrueを返す
  def active_for_authentication?
    super && (is_deleted == false)
  end

  # ゲストユーザーをさがす or 作成する
  def self.guest
    find_or_create_by!(email: 'guest@example') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guest"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

end
