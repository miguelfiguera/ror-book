class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user=User.find(params[:id])
        @comment=current_user.comments.create
        @posts=@user.posts.includes(:comments)
        @pending=Friendship.pending(@user)
        @room=current_user.rooms.create
    end

    def index
        # All the posibilities? To index users that I think I need
        @users=User.all_the_others(current_user)
        @friendships=Friendship.pending(current_user) + Friendship.my_friends(current_user)
        @mapped=@friendships.map{|x| x.user_id==current_user.id ? x.friend_id : x.user_id}

        @not_friends= @users - @friendships unless @users_id.nil? || @friends.nil?

        #creating the message from the index
        @room=current_user.rooms.create

        # Creating a Friendship Request

        @friendship=current_user.friendships.build
    end

    def friends
        @user=User.find(params[:user_id])
        @my_friends=Friendship.my_friends(@user)
    end


    private
    def user_params
        params.require(:user).permit(:email,:username)
    end

end
