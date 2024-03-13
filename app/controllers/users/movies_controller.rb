class Users::MoviesController < ApplicationController
  def index
    @movies_facade = MoviesFacade.new
  end
end
