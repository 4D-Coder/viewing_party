require 'rails_helper'

RSpec.describe 'Top Rated Movies, Movies Index Page', type: :feature do
  context "When I visit the 'users/:user_id/movies' path" do
    let(:user) { create(:user) }
    before do
      visit user_movies_path
    end

    describe 'As a User' do
      describe 'happy paths' do
        
      end

      describe 'sad paths' do
        # :{
      end
    end
  end
end
