class GetTopAlbumsController < ApplicationController
  before_action :set_get_top_album, only: %i[ show edit update destroy ]

  # GET /get_top_albums or /get_top_albums.json
  def index
    @get_top_albums = GetTopAlbum.all
  end

  # GET /get_top_albums/1 or /get_top_albums/1.json
  def show
  end

  # GET /get_top_albums/new
  def new
    @get_top_album = GetTopAlbum.new
  end

  # GET /get_top_albums/1/edit
  def edit
  end

  # POST /get_top_albums or /get_top_albums.json
  def create
    @get_top_album = GetTopAlbum.new(get_top_album_params)

    respond_to do |format|
      if @get_top_album.save
        format.html { redirect_to @get_top_album, notice: "Get top album was successfully created." }
        format.json { render :show, status: :created, location: @get_top_album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @get_top_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /get_top_albums/1 or /get_top_albums/1.json
  def update
    respond_to do |format|
      if @get_top_album.update(get_top_album_params)
        format.html { redirect_to @get_top_album, notice: "Get top album was successfully updated." }
        format.json { render :show, status: :ok, location: @get_top_album }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @get_top_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /get_top_albums/1 or /get_top_albums/1.json
  def destroy
    @get_top_album.destroy!

    respond_to do |format|
      format.html { redirect_to get_top_albums_path, status: :see_other, notice: "Get top album was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_get_top_album
      @get_top_album = GetTopAlbum.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def get_top_album_params
      params.fetch(:get_top_album, {})
    end
end
