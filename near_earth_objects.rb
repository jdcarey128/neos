require 'faraday'
require 'pry'
require_relative 'load_figaro'
require_relative 'nasa_api_service'

class NearEarthObjects

  def initialize(date)
    @date = date
    @parsed_astroids_data = NasaApiService.get_neos(date)
  end

  def largest_astroid_diameter
    @parsed_astroids_data.map do |astroid|
      astroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i
    end.max
    # end.max { |a,b| a<=> b}
  end

  def total_number_of_astroids
    @parsed_astroids_data.count
  end

  def astroid_data
    @parsed_astroids_data.map do |astroid|
      {
        name: astroid[:name],
        diameter: "#{astroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i} ft",
        miss_distance: "#{astroid[:close_approach_data][0][:miss_distance][:miles].to_i} miles"
      }
    end
  end

end
