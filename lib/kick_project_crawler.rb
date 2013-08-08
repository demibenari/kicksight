require 'rubygems'
require 'nokogiri'
require 'open-uri'

class KickProjectCrawler


  def loadProjects

    @url = 'http://www.kickstarter.com/projects/1708940685/spheres-of-power-a-new-pathfinder-magic-system?ref=home_spotlight'
    @doc = Nokogiri::HTML(open(@url))
    @doc.search('div #stats', '//h3/a').each { |link| puts link.content }

  end
end