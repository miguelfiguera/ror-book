class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'


  attribute :status, :string, default: 'pending'

  scope :pending, ->(user){where("friend_id = ? AND status = 'pending'", user.id)}
  scope :my_friends, ->(user){where("friend_id=? OR user_id=?",user.id,user.id).where("status='accepted'")}


  def accept!
    update_attribute(status: 'accepted')
  end

end
