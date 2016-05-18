require 'test_helper'
require 'TunesTakeoutWrapper'

class TunesTakeoutWrapperTest < ActiveSupport::TestCase
  describe TunesTakeoutWrapper do

    it "uses v1 of the API" do
      assert_equal "https://tunes-takeout-api.herokuapp.com/v1/", TunesTakeoutWrapper::BASE_URL
    end

    describe "API" do
      before do
        @suggestion = TunesTakeoutWrapper.find("monkey")
      end

      it "has a food_id", :vcr do
        refute @suggestion.food_id.nil?
      end

      it "has a music_id", :vcr do
        refute @suggestion.music_id.nil?
      end

      it "has a music_type", :vcr do
        refute @suggestion.music_type.nil?
      end
    end

  end

end
