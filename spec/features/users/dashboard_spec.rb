require 'rails_helper'

RSpec.describe 'User Dashboard Page', type: :feature do
  context "When I visit the '/users/:id/dashboard' path" do
    before do
      @user = create(:user)
      visit user_dashboard_path(@user.id)
    end

    describe 'As a user' do
      describe 'happy paths' do
        it 'should see a button to Discover Top Rated Movies' do
          expect(page).to have_button('Discover Top Rated Movies')
        end

        xit 'should see a text field to enter keyword(s) to search movie by title' do
          expect(page).to have_field('#movie_title_search')
        end

        xit 'should see a button to search movie by title' do
          expect(page).to have_button('Search Movie by Title')
        end
      end
    end
  end
end
