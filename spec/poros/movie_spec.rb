require 'rails_helper'

RSpec.describe Movie, type: :poro do
  let(:results) {
    {
      :adult=>false,
      :backdrop_path=>"/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
      :genre_ids=>[18, 80],
      :id=>278,
      :original_language=>"en",
      :original_title=>"The Shawshank Redemption",
      :overview=>
        "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
      :popularity=>121.841,
      :poster_path=>"/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg",
      :release_date=>"1994-09-23",
      :title=>"The Shawshank Redemption",
      :video=>false,
      :vote_average=>8.704,
      :vote_count=>25761
    }
  }
  let(:poro) { Movie.new(results) }
  describe 'initialize' do
    it 'exists and has required attributes' do
      expect(poro).to be_a Movie
      expect(poro.id).to eq(results[:id])
      expect(poro.title).to eq(results[:title])
      expect(poro.vote_average).to eq(results[:vote_average])
    end
  end
end
