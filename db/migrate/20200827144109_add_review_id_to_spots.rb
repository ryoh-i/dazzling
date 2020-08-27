class AddReviewIdToSpots < ActiveRecord::Migration[5.2]
  def change
    add_reference :spots, :review_id, foreign_key: true
  end
end
