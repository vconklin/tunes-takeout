require 'rspotify'

class SpotifyItem
  BASE_URL = "https://api.spotify.com/v1/"
  attr_reader :id, :type, :name, :url, :image

  def initialize(data)
    @id = data.id
    @type = data.type
    @name = data.name
    ## needs updating, documentation is outdated
    @url = data.external_urls["spotify"]
    # because in Track, the image is nested inside of album

    @image = if data.type == "track"
              if data.album.nil? || data.album.images.empty?
                "upload-empty.png"
              else
                data.album.images[0]["url"]
              end
             else
               if data.images.empty?
                 "upload-empty.png"
               else
                 data.images[0]["url"]
               end
             end
  end

  def self.find_by(id, music_type)
    case music_type
    when "artist"
      data = RSpotify::Artist.find(id)
    when "track"
      data = RSpotify::Track.find(id)
    when "album"
      data = RSpotify::Album.find(id)
    end

    # data is not a hash!
    self.new(data)
  end
end
