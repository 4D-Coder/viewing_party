class TmdbService < ApplicationService
  class << self
    def authenticate
      conn.get('/3/authentication')
    end

    def top_rated_movies
      conn.get('/3/movie/top_rated')
    end

    def search_movies(query)
      conn.get()
    end
  end
end
