class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:name]

  # アソシエーション
  has_many :projects, dependent: :destroy
  has_many :backers, dependent: :destroy
  has_many :participants, dependent: :destroy

end
