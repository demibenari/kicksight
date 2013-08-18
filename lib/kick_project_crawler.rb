require 'rubygems'
require 'nokogiri'
require 'open-uri'

class KickProjectCrawler

  def get_pledges_status(url)
    @doc = Nokogiri::HTML(open(url))

    listOfPledges = @doc.css('ul#what-you-get li h5')

    listOfPledges.each_with_index do |h_5_Pledge, index|
      puts h_5_Pledge.inner_text
    end

    listOfBackers = @doc.css('ul#what-you-get li p.backers-limits span.backers-wrap span.num-backers')
    listOfBackers.each_with_index do |h_5_Pledge, index|
      puts h_5_Pledge.inner_text
    end

    listOfDesc = @doc.css('ul#what-you-get li div.desc p.small_type')
    listOfDesc.each_with_index do |h_5_Pledge, index|
      puts h_5_Pledge.inner_text
    end

    listOfDeliveryDates = @doc.css('ul#what-you-get li div.delivery-date')
    listOfDeliveryDates.each_with_index do |h_5_Pledge, index|
      string = h_5_Pledge.inner_text
      string.slice! 'Estimated delivery:'
      string = string.lstrip.rstrip
      #     puts string
      converted = Date::strptime(string, '%b %Y')
      puts converted
      #
    end
  end

  def loadProjects

    @url = 'http://www.kickstarter.com/projects/1708940685/spheres-of-power-a-new-pathfinder-magic-system?ref=home_spotlight'
    @doc = Nokogiri::HTML(open(@url))
    #@doc.search('div #stats', '//h3/a').each { |link| puts link.content }

    # Project variable to fill
    project = Project.create!

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

    # "403 Backers    $14,713 pledged of $1,500 goal"

    project.goal= goal.to_i # Converting to integer type


    backersCount = @doc.css('div#backers_count').text
    puts backersCount

    pledged = @doc.css('div#pledged').text
    puts pledged

    listOfPledges = @doc.css('ul#what-you-get li')
    puts listOfPledges

  end
end