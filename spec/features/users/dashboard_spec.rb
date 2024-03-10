require 'rails_helper'

RSpec.describe 'User Dashboard Page', type: :feature do
  context "When I visit the '/users/:id/dashboard' path" do
    before do
      @user1 = create(:user)
      @user2 = create(:user)
      @vp1 = create(:viewing_party)
      @vp2 = create(:viewing_party)

      UserParty.create(
        viewing_party: @vp1,
        user: @user1,
        host: true
      )
      UserParty.create(
        viewing_party: @vp2,
        user: @user2,
        host: true
      )
      UserParty.create(
        viewing_party: @vp2,
        user: @user1,
        host: false
      )

      visit user_dashboard_path(@user1.id)
    end

    describe 'As a user' do
      describe 'happy paths' do
        it "should see the User's name as a header" do
          within('h1#main_header') do
            expect(page).to have_content("#{@user1.name}'s Dashboard")
          end
        end

        xit "should show all of that user's viewing parties and details" do
        end

        it 'should see a button to Discover Top Rated Movies' do
          expect(page).to have_button('Discover Top Rated Movies')
        end
      end
    end
  end
end
