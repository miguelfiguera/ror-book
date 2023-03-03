class RoomsController < ApplicationController
    def index
        @rooms= Room.user_rooms(current_user)
    end

    def show
        @room = Room.find(params[:id])
        @messages=@room.messages
        @message=@room.messages.create
    end

    def new
        @room=Room.new
    end

    def create
        @room=Room.new(room_params)

        respond_to do |f|
        if @room.save
            f.html{redirect_to @room}
        else
            #f.html{render json: @room.errors, status::unprocessable_entity}
        end
    end
    end

    def delete
        @room=Room.find(params[:id])
        @room.destroy
    end


    private
    def room_params
        params.require(:room).permit(:id,:user_id,:receiver_id)
    end
end