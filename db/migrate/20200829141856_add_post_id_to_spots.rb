class AddPostIdToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :post_id, :integer
  end
end
