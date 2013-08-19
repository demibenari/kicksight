require 'rubygems'
require 'nokogiri'
require 'open-uri'

class KickProjectCrawler
  def get_pledges_status(url)
    doc = Nokogiri::HTML(open(url))

    projectID = get_project_id_from_doc(doc)

    kickProjectID = Project.find_by_kick_id(projectID)

    if (!kickProjectID.nil?)

      listOfPledges = @doc.css('ul#what-you-get li h5')

      numberOfPledges = listOfPledges.length

      @pledgesArray = Array.new(numberOfPledges)
      @backersArray = Array.new(numberOfPledges)
      @descriptionsArray = Array.new(numberOfPledges)
      @deliveryDatesArray = Array.new(numberOfPledges)

      listOfPledges.each_with_index do |h_5_Pledge, index|
        pledgeAmount = parse_pledge_from_text(h_5_Pledge.inner_text)
        @pledgesArray[index] = pledgeAmount
      end

      listOfBackers = @doc.css('ul#what-you-get li p.backers-limits span.backers-wrap span.num-backers')
      listOfBackers.each_with_index do |numOfBakers, index|
        backersAmount = parse_backers(numOfBakers.inner_text)
        @backersArray[index] = backersAmount
      end

      listOfDesc = @doc.css('ul#what-you-get li div.desc p.small_type')
      listOfDesc.each_with_index do |description, index|
        @descriptionsArray[index] = description.inner_text
      end

      listOfDeliveryDates = @doc.css('ul#what-you-get li div.delivery-date')
      listOfDeliveryDates.each_with_index do |deliveryDate, index|
        convertedDate = parse_delivery_date(deliveryDate)
        @deliveryDatesArray[index] = convertedDate
      end


      #Pledge.create(:)
    else
      puts 'Wrong Project'
    end
  end


  def create_project(url)
    doc = Nokogiri::HTML(open(url))

    if (doc.nil?)
      puts 'Error opening the URL: ' + url
    else
      # string :kick_id
      kickProjectID = get_project_id_from_doc(doc)
      puts kickProjectID

      # integer :category_id

      # string :name
      projectTitle = doc.css('h2#title').text
      puts projectTitle

      # string :description
      shortDescription = doc.css('p.big_type').text
      puts shortDescription

      # t.integer :goal
      goal = doc.css('div#stats div#pledged').attr('data-goal').value
      puts goal.to_i # Converting to integer type

      fundingPeriodString = doc.css('div#meta p.tiny_type');
      fundingPeriodString = fundingPeriodString.text
      fundingPeriodString.slice! 'Funding period'

      array = fundingPeriodString.split('-')
      # date :start_date
      start_date_string = array[0]
      puts start_date_string

      # date :expiration_date
      expiration_date_string = array[1]
      index = expiration_date_string.index('(')
      expiration_date_string = expiration_date_string[0..index - 1]
      puts expiration_date_string

      # t.string :project_link

      # t.string :picture_link
      picture_link = doc.css('div#video-section div.video-player').attr('data-image').value;
      puts picture_link

      # t.string :video_link
      video_link = doc.css('div#video-section div.video-player').attr('data-video').value;
      puts video_link

      # t.integer :status_id
      # --- Needs to be checked if the project it the first time and then add the type of the status id

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

  end

  private

  #
  # Parses the Pledge amount from the format:
  # 'Pledge $1,000 or more' to the number that it represents
  # @param
  # @return number representation of the pledge
  #
  # @param [String] pledgeText - The Pledge in the Text format
  def parse_pledge_from_text(pledgeText)
    pledgeText.slice! 'Pledge'
    pledgeText.slice! 'or more'
    pledgeText.slice! '$'
    pledgeText.slice! ','

    return pledgeText.to_i
  end

  def parse_backers(backersText)
    backersText.slice! 'backers'
    backersText.slice! 'backer'

    backersText = backersText.lstrip.rstrip

    return backersText.to_i
  end

  def parse_delivery_date(deliveryDate)
    dateString = deliveryDate.inner_text
    dateString.slice! 'Estimated delivery:'
    dateString = dateString.lstrip.rstrip

    convertedDate = Date::strptime(dateString, '%b %Y')
    return convertedDate
  end

  def parse_kick_project_id(projectIdString)
    projectID = projectIdString.to_s
    projectID.slice! '/projects/'
    return projectID
  end

  def get_project_id_from_doc (doc)
    projectIdString = doc.css('h2#title a')
    projectIdString = projectIdString.attr('href')
    projectID = parse_kick_project_id(projectIdString)
    return projectID
  end
end