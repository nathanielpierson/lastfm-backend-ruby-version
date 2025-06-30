class CreateGetTopAlbums < ActiveRecord::Migration[8.0]
  def change
    create_table :get_top_albums do |t|
      t.timestamps
    end
  end
end
