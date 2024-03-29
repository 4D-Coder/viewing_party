# frozen_string_literal: false

require 'rails_helper'

RSpec.describe 'Root Page, Welcome Index', type: :feature do
  describe 'When a user visits the root path "/"' do
    before(:each) do
      @user1 = create(:user, name: 'Sam', email: 'sam_t@email.com')
      @user2 = create(:user, name: 'Tommy', email: 'tommy_t@gmail.com')

      visit root_path
    end

    it 'They see title of application, and link back to home page' do
      expect(page).to have_content('Viewing Party')
      expect(page).to have_link('Home')
    end

    it 'They see button to create a New User' do
      expect(page).to have_selector(:link_or_button, 'Create New User')
    end

    xit "They see a list of existing users, which links to the individual user's dashboard" do
      within('ul#existing_users') do
        expect(page).to have_content(@user1.email)
        expect(page).to have_content(@user2.email)
        expect(page).to have_link(@user1.email.to_s, href: "users/#{@user1.id}/dashboard")
        expect(page).to have_link(@user2.email.to_s, href: "users/#{@user2.id}/dashboard")
      end
    end

    it 'They see a link to go back to the landing page (present at the top of all pages)' do
      expect(page).to have_link('Home')
    end
  end
end
