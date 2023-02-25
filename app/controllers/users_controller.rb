class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user=User.find(params[:id])
    end

    def index
        @friends = User.friends.all
        @posts=current_user.includes(:posts)
        @not_friends=User.eager_load(:friendships).where("status!= 'pending' AND status!= 'accepted'")
    end



    private
    def user_params
        params.require(:user).permit(:email,:username)
    end

end
