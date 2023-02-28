class FriendshipsController < ApplicationController
    before_action :authenticate_user!

    def index
        @pending=Friendship.pending(current_user)
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
    params.require(:friendship).permit(:user_id,:friend_id,:status)
   end



end
