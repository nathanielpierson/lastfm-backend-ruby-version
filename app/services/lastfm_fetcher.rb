require "uri"
require "http"

class LastfmFetcher
  BASE_URL = "http://ws.audioscrobbler.com/2.0/"

    def self.get_album_data(user)
      if !user
        render json: { error: "User parameter is requred" }
      end
    response = HTTP.get(BASE_URL, params: {
      method: "user.getTopAlbums",
      user: user,
      # period: params[:period],
      # limit: params[:limit],
      api_key: ENV["LASTFM_API_KEY"],
      # shared_secret: ENV["LASTFM_SHARED_SECRET"],
      format: "json"
    })
    p response
    # if response.status.success?
    #   JSON.parse(response.body.to_s)
    # else
    #   { error: "Request failed", status: response.status }
    # end
  end
end

x = LastfmFetcher.get_album_data("Frogdunker")
