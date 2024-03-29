# frozen_string_literal: false

require 'rails_helper'

RSpec.describe MoviesFacade, type: :model do
  let(:facade) { MoviesFacade.new }
  describe '.initialize' do
    it 'exists' do
      expect(facade).to be_a MoviesFacade
    end

    describe '.top_rated_movies' do
      before { @results ||= facade.top_rated_movies }
      it 'returns a collection of 20 movie objects' do
        expect(@results).to be_an Array
        expect(@results.count).to eq(20)
        @results.each { |r| expect(r).to be_a Movie }
      end
    end

    describe '.movie_search' do
      before { @results ||= facade.movie_search('Coyote') }
      it 'returns a collection of movie objects all relevant to the search query' do
        @results.each do |r|
          expect(r).to be_a Movie
          expect(r.title.split.include?('Coyote')).to eq(true)
        end
      end
    end
  end
end
