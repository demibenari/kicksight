require 'test/unit'
require '../lib/kick_project_crawler'

class KickProjectCrawlerTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end


  def test_first_crawl
    crawler = KickProjectCrawler.new
    crawler.loadProjects



  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_fail

  end
end