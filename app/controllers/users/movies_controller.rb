class Users::MoviesController < ApplicationController
  def index

    conn = Faraday.new(url: 'https://api.themoviedb.org/') do |f|
      f.headers['Content-Type'] = 'application/json'
      f.headers['Authorization'] = "Bearer #{ENV['TMDB_BEARER']}"
    end

    response = conn.get('/3/authentication')
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
