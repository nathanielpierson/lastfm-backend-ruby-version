class TopAlbumsFromApiController < ApplicationController
  def index
  @albums = LastfmFetcher.get_album_data("Frogdunker", "overall")
  p @albums
  end
end
