class RemoveReviewIdIdFromSpots < ActiveRecord::Migration[5.2]
  def change
    remove_column :spots, :review_id_id, :bigint
  end
end
