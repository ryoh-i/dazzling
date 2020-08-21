class AddContentToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :content, :text
  end
end
