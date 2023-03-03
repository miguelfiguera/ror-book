class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true
  validates :user_id, presence:true

  scope :post_comments, ->(post){where("commentable_id = ? AND commentable_type = ? ",post.id,post.class)}
    
end
