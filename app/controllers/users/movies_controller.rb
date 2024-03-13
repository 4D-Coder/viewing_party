class Users::MoviesController < ApplicationController
  def index
    @movies_facade = MoviesFacade.new
  end

  def show
    require 'pry'; binding.pry
  end
end
