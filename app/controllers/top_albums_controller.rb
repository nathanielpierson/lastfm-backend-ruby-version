class TopAlbumsController < ApplicationController
  before_action only: %i[ show edit update destroy ]

  def index
    @top_albums = TopAlbum.all
    render :index
  end

  def show
  end

  def new
    @top_album = TopAlbum.new
  end

  def edit
    fetchArray = []
    fetchOverall = LastfmFetcher.get_album_data("Frogdunker", "overall")
    fetchArray.push(fetchOverall)
    fetchOneWeek = LastfmFetcher.get_album_data("Frogdunker", "7day")
    fetchArray.push(fetchOneWeek)
    fetchOneMonth = LastfmFetcher.get_album_data("Frogdunker", "1month")
    fetchArray.push(fetchOneMonth)
    fetchThreeMonth = LastfmFetcher.get_album_data("Frogdunker", "3month")
    fetchArray.push(fetchThreeMonth)
    fetchSixMonth = LastfmFetcher.get_album_data("Frogdunker", "6month")
    fetchArray.push(fetchSixMonth)
    fetchTwelveMonth = LastfmFetcher.get_album_data("Frogdunker", "12month")
    fetchArray.push(fetchTwelveMonth)
    y = 0
    fetches = 0
    # this loop checks for artists to see if they're already in database and creates an Artist row if they're not
    # cycles through each item in the fetch array, which are the album data fetches for each timeframe ("period" in the API)
    while fetches < fetchArray.length
      # loops through each album returned from an API fetch ("limit" in the API, default is 50)
      while y < fetchArray[fetches]["topalbums"]["album"].length
        dataInstance = fetchArray[fetches]["topalbums"]["album"][y]
        @artist = Artist.where(name: dataInstance["artist"]["name"])
        @album = TopAlbum.where(title: dataInstance["name"])
        # creates a new album AND a new artist if the artist is not currently in the database
        if @artist == []
          @artist = Artist.create(
            name: dataInstance["artist"]["name"]
          )
            @album = TopAlbum.create(
            title: dataInstance["name"],
            artist_id: @artist.id
          )
        elsif
          # creates a new album (no new artist) if the artist name exists but the album name doesn't
          @album == []
            @album = TopAlbum.create(
            title: dataInstance["name"],
            artist_id: Artist.find_by(name: dataInstance["artist"]["name"]).id
            # need to add artist_id to this create statement
          )
        else
          # Looks for album with name and gives it appropriate updated play count depending on which array we're on
          @album = TopAlbum.where(title: dataInstance["name"])
          if fetches == 0
            @album.update(
            play_count_total: dataInstance["playcount"]
          )
          elsif fetches == 1
            @album.update(
            one_week: dataInstance["playcount"]
          )
          elsif fetches == 2
            @album.update(
            one_month: dataInstance["playcount"]
          )
          elsif fetches == 3
            @album.update(
            three_month: dataInstance["playcount"]
          )
          elsif fetches == 4
            @album.update(
            six_month: dataInstance["playcount"]
          )
          elsif fetches == 5
            @album.update(
            twelve_month: dataInstance["playcount"]
          )
          end
        end
      y += 1
      end
      fetches += 1
      y = 0
    end
  end

  def create
    @top_album = TopAlbum.new(top_album_params)

    respond_to do |format|
      if @top_album.save
        format.html { redirect_to @top_album, notice: "Get top album was successfully created." }
        format.json { render :show, status: :created, location: @top_album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @top_album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @top_album.destroy!

    respond_to do |format|
      format.html { redirect_to top_albums_path, status: :see_other, notice: "Get top album was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end
