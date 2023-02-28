class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_one :profile
  has_many :friendships, dependent: :destroy
  has_many :friends,->{where("status = 'accepted'")}, through: :friendships, source: :friend
  has_many :likes




  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
