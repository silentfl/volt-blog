class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  validates :nickname, :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :posts
  has_many :comments
end
