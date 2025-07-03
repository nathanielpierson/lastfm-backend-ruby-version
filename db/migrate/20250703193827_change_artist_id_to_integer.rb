class ChangeArtistIdToInteger < ActiveRecord::Migration[8.0]
  def change
    remove_column :top_albums, :artist_id, :string
    add_column :top_albums, :artist_id, :integer
  end
end
