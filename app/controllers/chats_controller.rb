class ChatsController < ApplicationController
    before_action :authenticate_user!

    def create
        room = Room.find(params[:room_id])
        chat = room.chats.build(chat_params) #buildを使い、contentとtweet_idの二つを同時に代入
        chat.user_id = current_user.id
        if chat.save
        redirect_back(fallback_location: root_path)
        else
        redirect_back(fallback_location: root_path)
        end
    end

    private

        def chat_params
        params.require(:chat).permit(:content)
        end
end
