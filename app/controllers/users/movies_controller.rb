class Users::MoviesController < ApplicationController
  def index
    @movies_facade = MoviesFacade.new

    if params[:search].present?
      @search_results = @movies_facade.movie_search(params[:search])
    else
      @movies_facade
    end
  end

  def show; end
end
