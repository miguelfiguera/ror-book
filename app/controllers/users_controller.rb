class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user=User.find(params[:id])
        @comment=current_user.comments.create
        @posts=@user.posts.includes(:comments)
        @pending=Friendship.pending(@user)
    end

    def index
        # All the posibilities? To index users that I think I need
        @users=User.all_the_others(current_user)
        @users_ids=User.all_the_others(current_user).pluck(:id)
        @friends=current_user.friends == nil ? @friends=[] : @friends=current_user.friends
        @not_friends= @users_id - @friends - @pending unless @users_id.nil? || @friends.nil?||@pending

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
