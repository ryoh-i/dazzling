class AddContentToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :content, :text
  end
end
