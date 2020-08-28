class AddTextToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :text, :text
  end
end
