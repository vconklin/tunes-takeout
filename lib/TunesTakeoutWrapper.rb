require 'httparty'

class TunesTakeoutWrapper
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/v1/"

  def self.find(id)
    data = HTTParty.get(BASE_URL + "pokemon/#{id}/").parsed_response
  end

end
