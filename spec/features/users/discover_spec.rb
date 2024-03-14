require 'rails_helper'

RSpec.describe 'Example Page', type: :feature do
  context "When I visit the '/users/:user_id/discover' path" do
    let(:user) { create(:user) }
    before do

      visit user_discover_index_path(user)
    end

    describe 'As a User' do
      describe 'happy paths' do
        let(:movies_facade) { instance_double(MoviesFacade) } # Mock the facade

        before do
          allow(MoviesFacade).to receive(:new).and_return(movies_facade)
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

        it 'I should see a button to discover top movies' do
          within('div.top_rated_discover') do
            expect(page).to have_link('Discover Top Rated Movies')
          end
        end

        describe 'I can click on the Discover Top Rated Movies Button and see' do
          scenario "The results page with each movie's title as a link and vote average" do
            within('div.top_rated_discover') do
              click_link('Discover Top Rated Movies')
            end

            expect(page).to have_current_path(user_movies_path(user_id: user.id))

            # Move to movie_feature_spec.rb?
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

        it 'I should see a text field to enter keyword(s) to search movie by title and a submit button' do
          expect(page).to have_field('search')
          expect(page).to have_button('Search Movie by Title')
        end

        describe "I can fill out the 'Search Movie by Title' field and click submit," do
          scenario "and I see the results page with each movie's title as a link and vote average" do
            within('div.search_movies') do
              fill_in('search', with: 'Coyote')
              click_button 'Search Movie by Title'
            end

            # Move to movie_feature_spec.rb?
            expect(page).to have_current_path(user_movies_path(user_id: user.id))
            within('div.results') do
              expect(page).to have_selector('div#movie_1')
              expect(page).to have_selector('div#movie_2')
              expect(page).to have_selector('h3.movie_title', text: '1. Coyote and the Fox')
              expect(page).to have_selector('p.vote_average', text: 'Vote Average: 8.5')
              expect(page).to have_selector('h3.movie_title', text: '2. Coyote Killers II')
              expect(page).to have_selector('p.vote_average', text: 'Vote Average: 7.8')
            end
          end
        end
      end

      describe 'sad paths' do
      end
    end
  end
end
