class RoomsController < ApplicationController
    before_action :authenticate_user!

    def index
        @rooms = Room.all
        @room = Room.new
        @room.users << current_user
    end


    def create
        @room = Room.new(room_params)
        if @room.save
            flash[:notice] = 'グループ作成に成功しました。'
            redirect_back(fallback_location: root_path)
        else
            flash[:notice] = 'グループ作成にしっぱいしました。'
            redirect_back(fallback_location: root_path)
        end
    end

    def show
        @room = Room.find(params[:id])
        @chats = @room.chats
        @chat = Chat.new
    end

    private
    def room_params
        params.require(:room).permit(:name, user_ids: [] )
    end


end
