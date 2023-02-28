class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @owned=Post.current_user_posts(current_user)
    #@friends=Post.friends_posts(current_user)
  
  end

  def show
    @post=Post.find(params[:id])
    @comments=Post.post_comments(@post)
    @new_comment=@post.comments.create
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

    if @post.update(post_params)
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