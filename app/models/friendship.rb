class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'


  attribute :status, :string, default: 'pending'

  scope :pending, ->(user){where("friend_id = ? AND status = 'pending'", user.id)}

  def accept!
    update_attribute(status: 'accepted')
  end

end
