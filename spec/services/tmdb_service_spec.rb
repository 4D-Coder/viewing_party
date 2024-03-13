require 'rails_helper'

RSpec.describe TmdbService do
  describe '.authenticate' do
    it 'authenticates the validity of the current bearer token' do
      expect(TmdbService.authenticate[:success]).to eq true
    end
  end

  # describe '.movies' do
  #   it 'gets '
  # end
end
