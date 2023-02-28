class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user=User.find(params[:id])
        @comment=current_user.comments.create
        @posts=current_user.posts.includes(:comments)
    end

    def index
    end



    private
    def user_params
        params.require(:user).permit(:email,:username)
    end

end
