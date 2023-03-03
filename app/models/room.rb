class Room < ApplicationRecord
  belongs_to :user
  belongs_to :sender, class_name: 'User', foreign_key: 'receiver_id'
  has_many :messages


  scope :user_rooms, ->(user){where("user_id = ? OR receiver_id= ?",user.id,user.id)}


end
