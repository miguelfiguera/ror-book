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

         def self.from_omniauth(access_token)
          data = access_token.info
          user = User.where(email: data['email']).first
      
          # Uncomment the section below if you want users to be created if they don't exist
           unless user
               user = User.create(name: data['name'],
                  email: data['email'],
                  password: Devise.friendly_token[0,20]
               )
           end
          user
      end
end
