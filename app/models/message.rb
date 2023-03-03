class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  scope :room_messages,->(room){where("room_id = ?",room.id)}
end
