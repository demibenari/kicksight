require 'rubygems'
require 'nokogiri'
require 'open-uri'

class KickProjectCrawler


  def loadProjects

    @url = 'http://www.kickstarter.com/projects/1708940685/spheres-of-power-a-new-pathfinder-magic-system?ref=home_spotlight'
    @doc = Nokogiri::HTML(open(@url))
    #@doc.search('div #stats', '//h3/a').each { |link| puts link.content }

    # Project variable to fill
    project = Project.new

    projectTitle = @doc.css('h2#title').text
    puts projectTitle

    project.name = projectTitle

    shortDescription = @doc.css('p.big_type').text
    puts shortDescription

    goal = @doc.css('div#stats').text
    puts goal

    backersCount = @doc.css('div#backers_count').text
    puts backersCount

    pledged = @doc.css('div#pledged').text
    puts pledged

  end
end