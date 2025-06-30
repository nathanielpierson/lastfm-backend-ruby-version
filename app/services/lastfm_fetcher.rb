require "uri"
require "http"

class LastfmFetcher
  BASE_URL = "https://ws.audioscrobbler.com/2.0/"

    def self.get_album_data(user)
    response = HTTP.get(BASE_URL, params: {
      method: "user.getTopAlbums",
      user: user,
      api_key: ENV["API_KEY"],
      format: "json"
    })

    if response.status.success?
      JSON.parse(response.body.to_s)
    else
      { error: "Request failed", status: response.status }
    end
  end
end
