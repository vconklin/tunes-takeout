require 'httparty'

class Restaurant
  BASE_URL = "https://api.yelp.com/v2/"

  def initialize(data)
    @business_id = data["business_id"]
    @name = data["name"]
    @url = data["url"]
    @image_url = data["image_url"]
    @phone = data["phone"]
    @rating = data["rating"]
  end

  def self.find(id)
    data = HTTParty.get(BASE_URL + "business/#{id}").parsed_response

    self.new(data)
  end

end
