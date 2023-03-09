class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  #scopes
  scope :room_messages,->(room){where("room_id = ?",room.id)}


  #broadcasts
  after_create_commit -> { broadcast_append_to 'lol', partial: "messages/message", locals: {quote: self},target: 'lol'}
end
