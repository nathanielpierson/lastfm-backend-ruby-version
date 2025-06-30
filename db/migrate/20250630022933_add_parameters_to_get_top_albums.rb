class AddParametersToGetTopAlbums < ActiveRecord::Migration[8.0]
  def change
    add_column :get_top_albums, :title, :string
    add_column :get_top_albums, :artist_name, :string
    add_column :get_top_albums, :one_week, :integer
    add_column :get_top_albums, :one_month, :integer
    add_column :get_top_albums, :three_month, :integer
    add_column :get_top_albums, :six_month, :integer
    add_column :get_top_albums, :twelve_month, :integer
    add_column :get_top_albums, :play_count_total, :integer
  end
end
