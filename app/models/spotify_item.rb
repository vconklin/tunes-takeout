require 'rspotify'

class SpotifyItem
  BASE_URL = "https://api.spotify.com/v1/"

  def initialize(data)
    @item_id = data["item_id"]
    @type = data["type"]
    @name = data["name"]
    @url = data["url"]
    @image_url = data["image_url"]
  end

  ## write this once you know which type of music you need to pull in... wait, why do we even need this? doesn't rspotify do this parsing work for us?
  def self.find(id)
    data = RSpotify::Artist.find(id)

    self.new(data)
  end

  # like this?
  def self.find(id)
    data = RSpotify::Artist.find(id)

    self.new(data)
  end
end
