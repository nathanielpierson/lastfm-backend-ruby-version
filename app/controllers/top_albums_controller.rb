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
    fetchOneWeek = LastfmFetcherController.get_album_data("Frogdunker", "7day")
    fetchOneMonth = LastfmFetcherController.get_album_data("Frogdunker", "1month")
    fetchThreeMonth = LastfmFetcherController.get_album_data("Frogdunker", "3month")
    fetchSixMonth = LastfmFetcherController.get_album_data("Frogdunker", "6month")
    fetchTwelveMonth = LastfmFetcherController.get_album_data("Frogdunker", "12month")

    p fetchTwelveMonth["topalbums"]["album"][1]["name"]
    p fetchTwelveMonth["topalbums"]["album"][1]["playcount"]

    @top_album = TopAlbum.find_by(id: params[:id])
    # @top_album.update (
    # )
  end

  # POST /top_albums or /top_albums.json
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
