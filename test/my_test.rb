require 'test/unit'
require File.dirname(__FILE__) + '/../lib/kick_project_crawler'
require 'test_helper'

class MyTest < Test::Unit::TestCase

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

  def test_crawler
    crawler = KickProjectCrawler.new
    crawler.loadProjects

    assert true

  end
end