class ApplicationService
  class << self
    private

    def conn
      Faraday.new(url: 'https://api.themoviedb.org/') do |f|
        f.headers['Content-Type'] = 'application/json'
        f.headers['Authorization'] = "Bearer #{ENV['TMDB_BEARER']}"
      end
    end
  end
end
