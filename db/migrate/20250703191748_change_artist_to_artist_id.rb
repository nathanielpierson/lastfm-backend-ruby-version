class ChangeArtistToArtistId < ActiveRecord::Migration[8.0]
  def change
    rename_column :top_albums, :artist_name, :artist_id
  end
end
