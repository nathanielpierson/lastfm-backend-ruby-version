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
    totalFetchArray = []
    fetchOverall = LastfmFetcher.get_album_data("Frogdunker", "overall")
    totalFetchArray.push(fetchOverall)
    fetchOneWeek = LastfmFetcher.get_album_data("Frogdunker", "7day")
    totalFetchArray.push(fetchOneWeek)
    fetchOneMonth = LastfmFetcher.get_album_data("Frogdunker", "1month")
    totalFetchArray.push(fetchOneMonth)
    fetchThreeMonth = LastfmFetcher.get_album_data("Frogdunker", "3month")
    totalFetchArray.push(fetchThreeMonth)
    fetchSixMonth = LastfmFetcher.get_album_data("Frogdunker", "6month")
    totalFetchArray.push(fetchSixMonth)
    fetchTwelveMonth = LastfmFetcher.get_album_data("Frogdunker", "12month")
    totalFetchArray.push(fetchTwelveMonth)
    y = 0
    fetchesFetched = 0
    # this loop checks for artists to see if they're already in database and creates an Artist row if they're not
    while fetchesFetched < totalFetchArray.length
      while y < totalFetchArray[fetchesFetched]["topalbums"]["album"].length
        if Artist.find_by(name: totalFetchArray[fetchesFetched]["topalbums"]["album"][y]["artist"]["name"]) == []
          @artist = Artist.create(
            name: totalFetchArray[fetchesFetched]["topalbums"]["album"][y]["artist"]["name"]
          )
            @album = TopAlbum.create(
            title: totalFetchArray[fetchesFetched]["topalbums"]["album"][y]["name"],
            artist_id: @artist.id
          )
        elsif
          # Checks to make sure there isn't already an album with this name, then creates one if there isn't
          TopAlbum.where(title: totalFetchArray[fetchesFetched]["topalbums"]["album"][y]["name"]) == []
            @album = TopAlbum.create(
            title: totalFetchArray[fetchesFetched]["topalbums"]["album"][y]["name"],
            # need to add artist_id to this create statement
          )
        else
          # Looks for album with name and gives it appropriate updated play count depending on which array we're on
          @album = TopAlbum.where(title: totalFetchArray[fetchesFetched]["topalbums"]["album"][y]["name"])
          if fetchesFetched == 0
            @album.update(
            play_count_total: totalFetchArray[fetchesFetched]["topalbums"]["album"][y]["playcount"]
          )
          elsif fetchesFetched == 1
            @album.update(
            one_week: totalFetchArray[fetchesFetched]["topalbums"]["album"][y]["playcount"]
          )
          elsif fetchesFetched == 2
            @album.update(
            one_month: totalFetchArray[fetchesFetched]["topalbums"]["album"][y]["playcount"]
          )
          elsif fetchesFetched == 3
            @album.update(
            three_month: totalFetchArray[fetchesFetched]["topalbums"]["album"][y]["playcount"]
          )
          elsif fetchesFetched == 4
            @album.update(
            six_month: totalFetchArray[fetchesFetched]["topalbums"]["album"][y]["playcount"]
          )
          elsif fetchesFetched == 5
            @album.update(
            twelve_month: totalFetchArray[fetchesFetched]["topalbums"]["album"][y]["playcount"]
          )
          end
        end
      y += 1
      end
      fetchesFetched += 1
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
