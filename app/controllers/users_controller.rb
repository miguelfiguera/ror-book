class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user=User.find(params[:id])
        @comment=current_user.comments.create
        @posts=current_user.posts.includes(:comments)
        
    end

    def index
        # All the posibilities? To index users that I think I need
        @users=User.all_the_others(current_user)
        @users_ids=User.all_the_others(current_user).pluck(:id)
        #@pending=Friendship.where(user_id: current_user.id).or(where(friend_id:current_user.id)).and(status:'pending')
        @friends=current_user.friends == nil ? @friends=[] : @friends=current_user.friends
        @not_friends= @users_id - @friends - @pending unless @users_id.nil? || @friends.nil?||@pending

        # Creating a Friendship Request

        @friendship=current_user.friendships.build


    end



    private
    def user_params
        params.require(:user).permit(:email,:username)
    end

end
