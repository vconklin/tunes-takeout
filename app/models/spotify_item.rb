require 'httparty'

class SpotifyItem
  BASE_URL = "https://api.spotify.com/v1/"

  def initialize(data)
    @item_id = data["item_id"]
    @type = data["type"]
    @name = data["name"]
    @url = data["url"]
    @image_url = data["image_url"]
  end

  ## write this once you know which type of music you need to pull in
  # def self.find(id)
  #   data = HTTParty.get(BASE_URL + "artists/#{id}").parsed_response
  #
  #   self.new(data)
  # end
end
