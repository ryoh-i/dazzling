class AddProfileToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :profile, :string
  end

  def down
    add_column :posts, :profile, :string
  end

end
