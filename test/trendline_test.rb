require 'test/unit'
require File.dirname(__FILE__) + '/../lib/trendline'

class TrendLineTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_trendline


    arrayOfPoints = [[1,3],
                     [2,5],
                     [3,6.5]]

    trendline = Trendline.new(arrayOfPoints)
    trendline.calc_trenline()

    puts trendline.slope

    puts trendline.y_intercept

  end
end