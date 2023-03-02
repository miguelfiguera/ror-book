class Room < ApplicationRecord
  belongs_to :user
  belongs_to :sender, class_name: 'User', source: 'receiver_id'
  has_many :messages
end
