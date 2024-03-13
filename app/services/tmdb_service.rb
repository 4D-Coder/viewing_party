class TmdbService < ApplicationService
  class << self
    def authenticate
      conn.get('/3/authentication')
      # JSON.parse(response.body, symbolize_names: true)
    end

    def top_rated_movies
      conn.get('/3/movie/top_rated')
      # JSON.parse(response.body, symbolize_names: true)
    end
  end
end
