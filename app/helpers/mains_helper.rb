require 'trendline'

module MainsHelper
  def render_project(project, include_unnormal_fields = true)
    if include_unnormal_fields
      render :ok, json: project.to_json(:include => {:category => {except: :id},
                                                       :status => {except: :id}},
                                          except: [:category_id, :status_id])
    else
      render :ok, json: project.to_json(:include => {:category => {except: :id},
                                                       :status => {except: :id}})
    end

  end

  def get_dailies_by_kick_id (kick_id)
    project = Project.find_by_kick_id(kick_id).id

    all_dailies = nil

    if !project.nil?
      project_id = project
      all_dailies = Daily.where(:project_id => project_id)
    end

    return all_dailies

  end

  def get_all_daily_points_of_project(projectName)
    all_dailies = get_dailies_by_kick_id(projectName)

    length_of_dailies = all_dailies.length
    array_of_coords = Array.new(length_of_dailies) { [0, Daily.new] }

    all_dailies.each_with_index do |daily, index|
      array_of_coords[index][0] = index
      array_of_coords[index][1] = daily.amount_pledged
    end
    return array_of_coords
  end

  def get_all_daily_points_of_project_with_date(projectName)

    all_dailies = get_dailies_by_kick_id(projectName)

    length_of_dailies = all_dailies.length
    array_of_coords = Array.new(length_of_dailies) { [0, Daily.new, Date.new, 0, 0] }

    all_dailies.each_with_index do |daily, index|
      array_of_coords[index][0] = index
      array_of_coords[index][1] = daily.amount_pledged

      push_date = PushDate.find(daily.push_date_id)
      array_of_coords[index][2] = push_date.push_date
      array_of_coords[index][3] = daily.amount_backers
    end

    trenline = Trendline.new(array_of_coords)
    trenline.calc_trenline

    array_of_coords.each_with_index do |entry, index|
      array_of_coords[index][4] = trenline.get_y_by_x(index)
    end

    return array_of_coords
  end

end
