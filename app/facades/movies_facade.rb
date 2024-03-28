# frozen_string_literal: false

# Facade handling business logic of finding movie search results
class MoviesFacade
  def top_rated_movies
    results = TmdbService.top_rated_movies
    map(results)
  end

  def movie_search(query)
    results = TmdbService.search_movies(query)
    map(results)
  end

  private

  def parse(response_data)
    JSON.parse(response_data.body, symbolize_names: true)
  end

  def map(results)
    parsed_results = parse(results)[:results]
    parsed_results.map { |r| Movie.new(r) }
  end
end
