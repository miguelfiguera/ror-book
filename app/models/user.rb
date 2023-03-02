class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_one :profile
  has_many :friendships, dependent: :destroy
  has_many :friends,->{where("status = 'accepted'")}, through: :friendships, source: :friend
  has_many :likes


  scope :all_the_others, ->(user){where("id != ?",user.id)}
  
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
