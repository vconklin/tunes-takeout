require 'test_helper'

class SpotifyItemTest < ActiveSupport::TestCase
  describe SpotifyItem do
    it "uses v1 of the API" do
      assert_equal "https://api.spotify.com/v1/", SpotifyItem::BASE_URL
    end

    describe "API" do

      describe "track" do
        before do
          @track = SpotifyItem.find_by(ID_GOES_HERE, "track")
        end

        it "has an id", :vcr do
          refute @track.id.nil?
        end
      end

      describe "artist" do
        before do
          @artist = SpotifyItem.find_by(ID_GOES_HERE, "artist")
        end
      end

      describe "album" do
        before do
          @album = SpotifyItem.find_by(ID_GOES_HERE, "album")
        end
      end

    end

  end

end
