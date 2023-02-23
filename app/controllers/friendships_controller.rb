class FriendshipsController < ApplicationController
    before_action :authenticate_user!

   def new
    @friendship=Friendship.new 
   end

   def create
    @friendship=current_user.




end
