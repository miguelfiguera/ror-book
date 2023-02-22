class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :receiver, class_name: 'User', foreign_key: 'friend_id'

  #scope :friends ->{where("status = 'accepted'")}
  #scope :strangers ->{where("status='not_accepted' AND status!='pending'")}
  #scope :requested ->{where("status='pending'")}

  attribute :status, :string, default: 'pending'



  def accept!(friend_id)
    update(status: 'accepted')
  end

end
