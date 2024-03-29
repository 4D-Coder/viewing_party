# frozen_string_literal: false

require 'rails_helper'

RSpec.describe 'Example Page', type: :feature do
  context "When I visit the '/users/:user_id/discover' path" do
    before { @user1 = create(:user) }
    before { visit user_discover_index_path(@user1) }

    describe 'As a User' do
      describe 'happy paths' do
        it 'I should see a button to discover top movies' do
          within('div.top_rated_discover') do
            expect(page).to have_link('Discover Top Rated Movies')
          end
        end

        scenario 'Clicking on the Discover Top Rated Movies Button brings me to the correct url path' do
          within('div.top_rated_discover') do
            click_link('Discover Top Rated Movies')
          end

          expect(page).to have_current_path(user_movies_path(user_id: @user1.id))
        end

        it 'I should also see a text field to enter keyword(s) to search movie by title and a submit button' do
          expect(page).to have_field('search')
          expect(page).to have_button('Search Movie by Title')
        end

        context "I can fill out the 'Search Movie by Title' field and click submit," do
          scenario "and I see the results page with each movie's title as a link and vote average" do
            within('div.search_movies') do
              fill_in('search', with: 'Coyote')
              click_button 'Search Movie by Title'
            end

            expected_url = "/users/#{@user1.id}/movies?search=Coyote&commit=Search+Movie+by+Title"
            expect(page).to have_current_path(expected_url)
          end
        end
      end

      describe 'sad paths' do
      end
    end
  end
end
