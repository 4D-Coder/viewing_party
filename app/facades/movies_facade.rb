class MoviesFacade

  def top_rated_movies
    movies_data = TmdbService.top_rated_movies
    parsed_results = parse(movies_data)[:results]
    parsed_results.map do |r|
      Movie.new(r)
    end
  end

  private

  def parse(response_data)
    JSON.parse(response_data.body, symbolize_names: true)
  end
end
