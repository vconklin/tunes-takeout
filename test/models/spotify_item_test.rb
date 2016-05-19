require 'test_helper'

class SpotifyItemTest < ActiveSupport::TestCase
  describe SpotifyItem do
    it "uses v1 of the API" do
      assert_equal "https://api.spotify.com/v1/", SpotifyItem::BASE_URL
    end

    describe "API" do

      describe "track" do
        before do
          # fake tales of san francisco
          @track = SpotifyItem.find_by("3sF1JaoS1P9KqE0NDGANZt", "track")
        end

        it "has an id", :vcr do
          refute @track.id.nil?
        end

        it "has a type", :vcr do
          refute @track.type.nil?
        end

        it "has a name", :vcr do
          refute @track.name.nil?
        end

        it "has an image", :vcr do
          refute @track.image.nil?
        end
      end

      describe "artist" do
        before do
          # arctic monkeys (as of 5/18/16)
          @artist = SpotifyItem.find_by("7Ln80lUS6He07XvHI8qqHH", "artist")
        end

        it "has an id", :vcr do
          refute @artist.id.nil?
        end

        it "has a type", :vcr do
          refute @artist.type.nil?
        end

        it "has a name", :vcr do
          refute @artist.name.nil?
        end

        it "has an image", :vcr do
          refute @artist.image.nil?
        end
      end

      describe "album" do
        before do
          # five minutes with arctic monkeys
          @album = SpotifyItem.find_by("2MRFr0bOzV9OgVdK6gJXkZ", "album")
        end

        it "has an id", :vcr do
          refute @album.id.nil?
        end

        it "has a type", :vcr do
          refute @album.type.nil?
        end

        it "has a name", :vcr do
          refute @album.name.nil?
        end

        it "has an image", :vcr do
          refute @album.image.nil?
        end
      end

    end

  end

end
