require 'rails_helper'

RSpec.describe 'Example Page', type: :feature do
  context "When I visit the '/users/:user_id/discover' path" do
    let(:user) { create(:user) }
    before do
      # @user1 = create(:user)
      # @user2 = create(:user)
      # @vp1 = create(:viewing_party)
      # @vp2 = create(:viewing_party)

      # UserParty.create(
      #   viewing_party: @vp1,
      #   user: @user1,
      #   host: true
      # )
      # UserParty.create(
      #   viewing_party: @vp2,
      #   user: @user2,
      #   host: true
      # )
      # UserParty.create(
      #   viewing_party: @vp2,
      #   user: @user1,
      #   host: false
      # )

      visit user_discover_index_path(user)
    end

    describe 'As a User' do
      describe 'happy paths' do
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
            within('div.results') do
              expect(page).to have_selector('h3.movie_title')
              expect(page).to have_selector('p.vote_average')
            end
          end
        end

        it 'I should see a text field to enter keyword(s) to search movie by title and a submit button' do
          expect(page).to have_field('movie_title_search')
          expect(page).to have_button('Search Movie by Title')
        end
      end

      describe 'sad paths' do
      end
    end
  end
end
