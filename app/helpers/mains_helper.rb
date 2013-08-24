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
end
