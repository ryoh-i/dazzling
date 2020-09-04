class AddReviewIdToSpot < ActiveRecord::Migration[5.2]
  def change
    add_reference :spots, :review, foreign_key: true
  end
end
