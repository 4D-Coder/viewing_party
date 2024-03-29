# frozen_string_literal: false

require 'rails_helper'

RSpec.describe 'Top Rated Movies, Movies Index Page', type: :feature do
  context "When I visit the 'users/:user_id/movies' path" do
    before { @user1 = create(:user) }
    describe 'As a User' do
      describe 'happy paths' do
        describe 'When on the movie results page without a search query, I can see' do
          before do
            allow(MoviesFacade).to receive(:new).and_return(@movies_facade)
            allow(@movies_facade).to receive(:top_rated_movies).and_return(
              [
                instance_double(Movie, id: 1, title: 'Movie 1', vote_average: 8.5),
                instance_double(Movie, id: 2, title: 'Movie 2', vote_average: 7.8)
              ]
            )

            visit user_movies_path(@user1)
          end

          scenario 'each top movie result including a title as a link, and a vote average' do
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

        describe 'When on the movie results page with a search query, I can see' do
          before do
            allow(MoviesFacade).to receive(:new).and_return(@movies_facade)
            allow(@movies_facade).to receive(:movie_search).with('Coyote').and_return(
              [
                instance_double(Movie, id: 1, title: 'Coyote and the Fox', vote_average: 8.5),
                instance_double(Movie, id: 2, title: 'Coyote Killers II', vote_average: 7.8)
              ]
            )
          end

          scenario "each movie's title relevant to the query as a link with a vote average" do
            visit user_discover_index_path(@user1)
            fill_in 'search', with: 'Coyote'
            click_button 'Search Movie by Title'

            within('div.search_results') do
              expect(page).to have_selector('div#movie_1')
              expect(page).to have_selector('div#movie_2')
              expect(page).to have_selector('h3.movie_title', text: 'Coyote and the Fox')
              expect(page).to have_selector('p.vote_average', text: 'Vote Average: 8.5')
              expect(page).to have_selector('h3.movie_title', text: 'Coyote Killers II')
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
