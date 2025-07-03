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
    y = 0 # increment for fetchSixMonth
    fetchesFetched = 0
    while fetchesFetched <= 5
      while y < totalFetchArray[fetchesFetched]["topalbums"]["album"].length
        if Artist.find_by(name: totalFetchArray[fetchesFetched]["topalbums"]["album"][y]["artist"]["name"])
        else
          Artist.create(
            name: totalFetchArray[fetchesFetched]["topalbums"]["album"][y]["artist"]["name"]
          )
        end
      y += 1
      end
      fetchesFetched += 1
      y = 0
    end

    # @top_album = TopAlbum.find_by(id: params[:id])
    # @top_album.update (
    # )
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

  def update
    respond_to do |format|
      if @top_album.update(top_album_params)
        format.html { redirect_to @top_album, notice: "Get top album was successfully updated." }
        format.json { render :show, status: :ok, location: @top_album }
      else
        format.html { render :edit, status: :unprocessable_entity }
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
