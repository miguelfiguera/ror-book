class PostsController < ApplicationController


  def index
    @owned=current_user.posts
    @friends_posts= current_user.friends.posts.all
  end

  def show
    @post=Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post=current_user.build.posts(posts_params)

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
    @post=current_user.build.posts(posts_params)

    if @post.update 
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