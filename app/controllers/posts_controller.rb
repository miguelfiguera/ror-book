class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @owned=Post.current_user_posts(current_user)
    @mapped=Friendship.my_friends(current_user).map{|x| x.user_id==current_user.id ? x.friend_id : x.user_id}
    @mapped_posts= Post.where("user_id IN (?)",@mapped)
  end

  def show
    @post=Post.find(params[:id])
    @comment=@post.comments.create #this lets me create a comment from PostShow
    @comments=@post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post=Post.new(posts_params)

    if @post.save 
      #here it goes the turbo stream part
      flash[:notice]='Post created!'

    else 
      render new
    end

  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])

    if @post.update(posts_params)
     #here it goes the turbo stream part
      flash[:notice]='Post Updated'
    else 
      render edit_post_path
    end
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
  end





  private
  def posts_params
    params.require(:post).permit(:title,:body,:user_id)
  end
end