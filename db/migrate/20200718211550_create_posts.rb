class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :image
      t.string :art_name
      t.string :review

      t.timestamps
    end
  end
end
