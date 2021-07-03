class AddContentToUserRoomRelations < ActiveRecord::Migration[6.0]
  def change
    add_column :user_room_relations, :content, :string
  end
end
