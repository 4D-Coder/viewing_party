require 'rails_helper'

RSpec.describe TmdbService do
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  describe '.authenticate' do
    # let(:response) { TmdbService.authenticate }
    before { @response ||= TmdbService.authenticate }
    it 'authenticates the validity of the current bearer token' do
      expect(@response.status).to eq 200
    end
  end

  context '.top_rated_movies' do
    # let(:response) { TmdbService.top_rated_movies }
    before { @response ||= TmdbService.top_rated_movies }
    let(:parsed) { parse(@response) }

    describe 'When Successful' do
      it 'has a 200 status' do
        expect(@response.status).to eq 200
      end

      it 'each movie has required attributes as keys with correct data type values' do
        parsed[:results].each do |r|
          expect(r.keys.include?(:title)).to eq true
          expect(r[:title]).to be_a String
          expect(r.keys.include?(:vote_average)).to eq true
          expect(r[:vote_average]).to be_a Float
        end
      end
    end
  end

  context '.search_movies' do
    let(:query) { Faker::Movie.title }
    before do
      @response ||= TmdbService.search_movies(query)
      @parsed = parse(@response)
    end

    describe 'When Successful' do
      it 'has a 200 status' do
        expect(@response.status).to eq 200
      end

      it 'each movie has required attributes as keys with correct data type values' do
        @parsed[:results].each do |r|
          expect(r.keys.include?(:title)).to eq true
          expect(r[:title]).to be_a String
          expect(r.keys.include?(:vote_average)).to eq true
          expect(r[:vote_average]).to be_a Float
        end
      end
    end
  end
end
