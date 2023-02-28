class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'


  attribute :status, :string, default: 'pending'



  def accept!(friend_id)
    update(status: 'accepted')
  end

end
