require 'rspotify'

class SpotifyItem
  BASE_URL = "https://api.spotify.com/v1/"
  attr_reader :id, :type, :name, :url, :image_url

  def initialize(data)
    @id = data.id
    @type = data.type
    @name = data.name
    ## needs updating, documentation is outdated
    # @url = data.url
    # @image_url = data.image_url
  end

  ## write this once you know which type of music you need to pull in... wait, why do we even need this? doesn't rspotify do this parsing work for us?
  def self.find_by(id, music_type)
    case music_type
    when "artist"
      data = RSpotify::Artist.find(id)
    when "track"
      data = RSpotify::Track.find(id)
    when "playlist"
      data = RSpotify::Playlist.find(id)
    when "album"
      data = RSpotify::Album.find(id)
    end

    # data is not a hash!
    self.new(data)
  end
end
