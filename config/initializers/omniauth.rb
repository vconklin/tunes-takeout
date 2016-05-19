Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, SPOTIFY_CLIENT_ID, SPOTIFY_CLIENT_SECRET
end
