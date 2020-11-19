require 'faraday'

class NasaApiService
  def self.get_neos(date)
    conn = Faraday.new(
      url: 'https://api.nasa.gov',
      params: { start_date: date, api_key: ENV['nasa_api_key']}
    )
    response = conn.get('/neo/rest/v1/feed')
    self.parse_data(response, date)
  end

  def self.parse_data(response, date)
    JSON.parse(response.body, symbolize_names: true)[:near_earth_objects][:"#{date}"]
  end

end
