require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'near_earth_objects'

class NearEarthObjectsTest < Minitest::Test
  def test_a_date_returns_a_list_of_neos
    instance = NearEarthObjects.new('2019-03-30')
    results = instance.formatted_asteroid_data
    # assert_equal '(2019 GD4)', results[:astroid_list][0][:name]
    assert_equal '(2011 GE3)', results[0][:name]
  end

  def test_it_can_return_largest_astroid
    instance = NearEarthObjects.new('2019-03-30')
    result = instance.largest_astroid_diameter
    assert_equal 537, result
  end

  def test_it_can_return_the_number_of_astroids
    instance = NearEarthObjects.new('2019-03-30')
    result = instance.total_number_of_astroids
    assert_equal 10, result
  end
end
