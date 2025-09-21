require "uri"
require "http"
require_relative "../../config/environment"
class LastfmFetcher
  BASE_URL = "http://ws.audioscrobbler.com/2.0/"

    def self.get_album_data(user, period)
    response = HTTP.get(BASE_URL, params: {
      method: "user.getTopAlbums",
      user: user,
      period: period,
      limit: 400,
      api_key: Rails.application.credentials.dig(:api_key),
      format: "json"
    })
    p albums = response.parse
    # if response.status.success?
    #   JSON.parse(response.body.to_s)
    # else
    #   { error: "Request failed", status: response.status }
    # end
  end
end

x = LastfmFetcher.get_album_data("Frogdunker", "1month")
