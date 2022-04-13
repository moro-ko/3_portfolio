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

  has_one_attached :image

  # ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないよう制約をかける
  # is_deletedがfalseならtrueを返す
  def active_for_authentication?
    super && (is_deleted == false)
  end

end
