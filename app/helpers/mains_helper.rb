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
end
