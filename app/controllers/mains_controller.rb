class MainsController < ApplicationController
  def index
    respond_to do |format|
      @project = Project.find_by(0)

      format.html
      format.json { render json: @project }
    end

  end

  #
  # returns all the projects in the Data Base
  #
  def get_projects
    include_unnormal_fields = params[:withIDs]

    @projects = Project.all

    if include_unnormal_fields.nil?
      render :ok, json: @projects.to_json(:include => {:category => {except: :id},
                                                       :status => {except: :id}},
                                          except: [:category_id, :status_id])
    else
      render :ok, json: @projects.to_json(:include => {:category => {except: :id},
                                                       :status => {except: :id}})
    end
  end

  def get_project
    projectID = params[:projectID]

    if !projectID.nil?
      @project = Project.find_by_kick_id(projectID);
      render :ok, json: @project.to_json(:include => {:category => {except: :id},
                                                      :status => {except: :id}},
                                         except: [:category_id, :status_id])
    end
  end
end
