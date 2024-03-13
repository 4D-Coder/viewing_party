class TmdbService < ApplicationService
  class << self
    RETURN = {}

    def authenticate
      RETURN[:response] = conn.get('/3/authentication')
      RETURN[:parsed] = JSON.parse(RETURN[:response].body, symbolize_names: true)
      RETURN
    end

    def top_rated_movies
      RETURN[:response] = conn.get('/3/movie/top_rated')
      RETURN[:parsed] = JSON.parse(RETURN[:response].body, symbolize_names: true)
      RETURN
    end
  end
end
