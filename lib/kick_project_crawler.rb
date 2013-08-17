require 'rubygems'
require 'nokogiri'
require 'open-uri'
require File.dirname(__FILE__) + '/../app/models/project'

class KickProjectCrawler

  def loadProjects

    @url = 'http://www.kickstarter.com/projects/1708940685/spheres-of-power-a-new-pathfinder-magic-system?ref=home_spotlight'
    @doc = Nokogiri::HTML(open(@url))
    #@doc.search('div #stats', '//h3/a').each { |link| puts link.content }

    # Project variable to fill
    project = Project.new

    # Project Title
    projectTitle = @doc.css('h2#title').text
    puts projectTitle

    project.name = projectTitle

    # Project Description
    shortDescription = @doc.css('p.big_type').text
    puts shortDescription

    project.description= shortDescription

    # Project Goal
    goal = @doc.css('div#stats').text
    puts goal

    project.goal= goal.to_i # Converting to integer type


    backersCount = @doc.css('div#backers_count').text
    puts backersCount

    pledged = @doc.css('div#pledged').text
    puts pledged

    listOfPledges = @doc.css('ul#what-you-get li')
    puts listOfPledges

  end
end