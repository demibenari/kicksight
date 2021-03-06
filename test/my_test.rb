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
    #crawler.get_pledges_status('http://www.kickstarter.com/projects/1708940685/spheres-of-power-a-new-pathfinder-magic-system?ref=home_spotlight')
    crawler.create_project('http://www.kickstarter.com/projects/1708940685/spheres-of-power-a-new-pathfinder-magic-system?ref=home_spotlight')
    assert true
    path_to_links =  '/assets/' + 'project_links_min.csv'
    puts path_to_links

    path_to_links = asset-path('project_links_min.csv')
    puts path_to_links

    #ActionController::Base.helpers.asset_path('project_links_min.csv')

    File.open(path_to_links) do |file|
      file.each do |line|
        current_link = line.gsub(/\n/,'')
        puts current_link
      end
    end
  end
end