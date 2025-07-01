class TopAlbumsController < ApplicationController
  before_action :set_top_album, only: %i[ show edit update destroy ]

  def index
    @top_albums = GetTopAlbum.all
    render :index
  end

  def show
  end

  # GET /top_albums/new
  def new
    @top_album = GetTopAlbum.new
  end

  # GET /top_albums/1/edit
  def edit
  end

  # POST /top_albums or /top_albums.json
  def create
    @top_album = GetTopAlbum.new(top_album_params)

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_top_album
      @top_album = GetTopAlbum.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def top_album_params
      params.fetch(:top_album, {})
    end
end
