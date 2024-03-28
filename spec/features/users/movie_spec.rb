require 'rails_helper'

RSpec.describe 'Top Rated Movies, Movies Index Page', type: :feature do
  context "When I visit the 'users/:user_id/movies' path" do
    let(:user) { create(:user) }
    before do
      visit user_movies_path
    end

    describe 'As a User' do
      describe 'happy paths' do
        before do
          # allow(MoviesFacade).to receive(:new).and_return(movies_facade)
          @movies_facade = MoviesFacade.new
          allow(movies_facade).to receive(:top_rated_movies).and_return(
            [
              instance_double(Movie, id: 1, title: 'Movie 1', vote_average: 8.5),
              instance_double(Movie, id: 2, title: 'Movie 2', vote_average: 7.8)
            ]
          )
          allow(movies_facade).to receive(:movie_search).with('Coyote').and_return(
            [
              instance_double(Movie, id: 1, title: 'Coyote and the Fox', vote_average: 8.5),
              instance_double(Movie, id: 2, title: 'Coyote Killers II', vote_average: 7.8)
            ]
          )
        end

        describe 'When on the movie results page, I can see' do
          scenario "each movie's title as a link with a vote average" do
            within('div.results') do
              expect(page).to have_selector('div#movie_1')
              expect(page).to have_selector('div#movie_2')
              expect(page).to have_selector('h3.movie_title', text: '1. Movie 1')
              expect(page).to have_selector('p.vote_average', text: 'Vote Average: 8.5')
              expect(page).to have_selector('h3.movie_title', text: '2. Movie 2')
              expect(page).to have_selector('p.vote_average', text: 'Vote Average: 7.8')
            end
          end
        end
      end

      describe 'sad paths' do
        # :{
      end
    end
  end
end
