class MoviesFacade
  def top_rated_movies
    movies_data = TmdbService.top_rated_movies
  end
end
