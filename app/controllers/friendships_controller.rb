class FriendshipsController < ApplicationController
    before_action :authenticate_user!

    def index
        @owned=current_user.posts
        @friends_posts= current_user.friends.posts.all
    end

    def show
        @post=Post.find(params[:id])
    end

    



    private
    def posts_params
        params.require(:post).permit(:title,:body,:user_id)
end
