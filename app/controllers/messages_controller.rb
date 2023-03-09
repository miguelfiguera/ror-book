class MessagesController < ApplicationController
before_action :set_room, only: %i[ new create ]
    def index
        @room=Room.find(params[:room_id])
        @messages= Message.room_messages(@room).limit(20)
    end
    def new
        @message=Message.new
    end

    def show
        @message=Message.find(params[:id])
    end

    def create
        @message=Message.new(message_params)

        respond_to do |format|
            if @message.save
            format.html{redirect_to @room} 
            format.turbo_stream
            end
        end
    end


    private
    def set_room
        @room=Room.find(params[:room_id])
    end

    def message_params
        params.require(:message).permit(:id,:user_id,:room_id,:receiver_id,:body,:sender_name,:receiver_name)
    end
end
