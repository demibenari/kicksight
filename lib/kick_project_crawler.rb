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
        convertedDate = parse_delivery_date(deliveryDate.inner_text)
        @deliveryDatesArray[index] = convertedDate
      end


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

      category_element = doc.css('ul#project-metadata li.category')
      parent_category = category_element.attr('data-project-parent-category')
      # parent_category
      category = Category.find_by_description(parent_category.to_s)
      puts category.id.to_s + ' ' + category.description.to_s

      # sub_category
      category_text = category_element.inner_text
      category_text = category_text.lstrip.rstrip
      sub_category = Subcategory.find_by_description(category_text)
      puts sub_category.id.to_s + ' ' + sub_category.description.to_s

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
      s_date = parse_date(start_date_string)
      puts s_date

      # date :expiration_date
      expiration_date_string = array[1]
      index = expiration_date_string.index('(')
      expiration_date_string = expiration_date_string[0..index - 1]

      expiration_date = parse_date(expiration_date_string)

      puts expiration_date

      # t.string :project_link
      project_link = url
      puts project_link

      # t.string :picture_link
      picture_link = doc.css('div#video-section div.video-player').attr('data-image').value;
      puts picture_link

      # t.string :video_link
      video_link = doc.css('div#video-section div.video-player').attr('data-video').value;
      puts video_link

      project_status_id = 0;
      # t.integer :status_id
      if (expiration_date < Date.today)
        archivedStatus = Status.find_by_description('Archived')
        project_status_id = archivedStatus.id
      else
        activeStatus = Status.find_by_description('Active')
        project_status_id = activeStatus.id
      end

      project = Project.create(kick_id: kickProjectID, category_id: category.id,
                               name: projectTitle, description: shortDescription,
                               goal: goal, start_date: s_date, expiration_date: expiration_date,
                               project_link: project_link, picture_link: picture_link,
                               video_link: video_link, status_id: project_status_id)

      # --- Needs to be checked if the project it the first time and then add the type of the status id

    end
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

  #
  # Parses from the Format: 'Aug 3, 2013' to a date Object
  #
  def parse_date(date_text)
    date = date_text.lstrip.rstrip
    convertedDate = Date::strptime(date, '%b %d, %Y')
    return convertedDate
  end

  def parse_delivery_date(deliveryDate)
    dateString = deliveryDate
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