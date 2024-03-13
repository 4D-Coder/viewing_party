class TmdbService < ApplicationService
  class << self
    def authenticate
      response = conn.get('/3/authentication')
      JSON.parse(response.body, symbolize_names: true)
    end

    # def top_rated_movies
    # end
  end
end
