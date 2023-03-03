class MessagesController < ApplicationController
before_action :set_room, only: %i[ new create ]

    def new
        @message=Message.new
    end

    def create
        @message=Message.new(message_params)

        respond_to do |format|
            format.html{redirect_to @room} if @message.save
        end
    end


    private
    def set_room
        @room=Room.find(params[:room_id])
    end

    def message_params
        params.require(:message).permit(:id,:user_id,:room_id,:receiver_id,:body)
    end
end
