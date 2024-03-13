require 'rails_helper'

RSpec.describe MoviesFacade, type: :model do
  let(:facade) { MoviesFacade.new }
  describe '.initialize' do
    it 'exists' do
      expect(facade).to be_a MoviesFacade
    end

    describe '.top_rated_movies' do
      it 'returns a collection of 20 movie objects' do
        results = facade.top_rated_movies

        expect(results.count).to eq(20)
        results.each { |r| expect(r).to be_a Movie }
      end
    end
  end
end
