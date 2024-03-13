require 'rails_helper'

RSpec.describe TmdbService do
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  describe '.authenticate' do
    let(:response) { TmdbService.authenticate }

    it 'authenticates the validity of the current bearer token' do
      expect(response.status).to eq 200
    end
  end

  context '.top_rated_movies' do
    let(:response) { TmdbService.top_rated_movies }

    describe 'When Successful' do
      it 'has a 200 status' do
        expect(response.status).to eq 200
      end

      it 'returns parsed JSON data as a symbolized hash of 20 movie results' do
        parsed = parse(response)

        expect(parsed[:results].count).to eq 20
      end

      it 'each movie has required attributes as keys with correct data type values' do
        parsed = parse(response)

        parsed[:results].each do |r|
          expect(r.keys.include?(:title)).to eq true
          expect(r[:title]).to be_a String
          expect(r.keys.include?(:vote_average)).to eq true
          expect(r[:vote_average]).to be_a Float
        end
      end
    end
  end
end
