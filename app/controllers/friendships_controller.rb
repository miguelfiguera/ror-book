class FriendshipsController < ApplicationController

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

   def edit
    @friendship=Friendship.find(params[:id])
   end

   def update
    @friendship=Friendship.find(params[:id])
    if @friendship.update(friendship_params)
        #awesome rails
    else
        render edit
    end
    end

    def destroy
        @friendship=Friendship.find(params[:id])
        @friendship.destroy
    end

    def accept!
        @friendship=Friendship.find(params[:id])
        @friendship.accept!
    end


   private
   def friendship_params
    params.require(:friendship).permit(:user_id,:friend_id,:status)
   end



end
