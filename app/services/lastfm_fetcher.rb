require "uri"
require "http"
require "dotenv/load"


class LastfmFetcher
  BASE_URL = "http://ws.audioscrobbler.com/2.0/"

    def self.get_album_data(user, period)
    response = HTTP.get(BASE_URL, params: {
      method: "user.getTopAlbums",
      user: user,
      period: period,
      # limit: params[:limit],
      api_key: ENV["LASTFM_API_KEY"],
      format: "json"
    })
    albums = response.parse
    p albums["topalbums"]["album"][1]["playcount"]
    # if response.status.success?
    #   JSON.parse(response.body.to_s)
    # else
    #   { error: "Request failed", status: response.status }
    # end
  end
end

x = LastfmFetcher.get_album_data("Frogdunker", "6month")
