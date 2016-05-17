require 'httparty'

class TunesTakeoutWrapper
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/v1/"

  # is this supposed to be how this works? self method? .search or .find?
  def self.search(query)
    HTTParty.get(BASE_URL + "search?query=#{query}/").parsed_response
  end

end
