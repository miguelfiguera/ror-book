class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, as: :commentable
    has_many :likes

    validates :title, presence: true
    validates :body, presence: true

    scope :post_comments,->(post){Comment.all.where('commentable_id = ? AND commentable_type = ?', post.id,post.class)}
    scope :current_user_posts, -> (current_user){where('user_id = ?', current_user.id)}
    #scope :friends_posts, ->(current_user){where('user_id IN ? AND user_id != ?',current_user.friendships.pluck(:friend,:user_id),current_user.id)}
end
