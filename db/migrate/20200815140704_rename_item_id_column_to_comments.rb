class RenameItemIdColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :item_id, :post_id
  end
end
