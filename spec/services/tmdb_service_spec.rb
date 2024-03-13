require 'rails_helper'

RSpec.describe TmdbService do
  describe '.authenticate' do
    it 'authenticates the validity of the current bearer token' do
      expect(TmdbService.authenticate[:success]).to eq true
    end
  end

  describe '.top_rated_movies' do
    it 'returns parsed JSON, symbolized hash of movie result data' do
      expect
    end
  end
end
