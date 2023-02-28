class FriendshipsController < ApplicationController
    before_action :authenticate_user!

    def index
        @pending=current_user.friendships.where(friend:current_user.id)
    end

   def new
    @friendship=Friendship.new 
   end

   def create
    @friendship=Friendship.new(friendship_params)
    
    if @friendship.save
        flash[:notice]='Friendship Request pending.'

    else
        flash[:alert]='Friendship Request NOT created.'
        render new
    end 

    end

    def destroy
        @friendship=Friendship.find(params[:id])
        @friendship.destroy
    end




   private
   def friendship_params
    params.require(:friendship).permit(:user_id,:friend,:status)
   end



end
