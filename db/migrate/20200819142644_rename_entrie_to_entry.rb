class RenameEntrieToEntry < ActiveRecord::Migration[5.2]
  def change
    rename_table :entries, :entrys
  end
end
