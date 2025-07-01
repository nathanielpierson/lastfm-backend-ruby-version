class ChangeTableNameRemoveGet < ActiveRecord::Migration[8.0]
  def change
  rename_table :get_top_albums, :top_albums
  end
end
