class MainsController < ApplicationController
  include MainsHelper

  #
  # The index returns the main page of the application
  #
  def index
    respond_to do |format|
      @project = Project.find_by(0)
      format.html
    end
  end

  #
  # @projects returns all the projects in the Data Base
  #
  # Optional Parameter:
  # withIDs: if true, an unnormal form will be returned
  # cat_id: the category id to filter the projects by (if not exists, all the categories are returned)
  #
  def get_projects
    include_unnormal_fields = params[:withIDs]
    category_id = params[:cat_id]

    if (!category_id.nil?)
      @projects = Project.where(category_id: category_id)
    else
      @projects = Project.all
    end

    render_project(@projects, !include_unnormal_fields.nil?)
  end

  def get_project
    projectID = params[:projectID]

    if !projectID.nil?
      @project = Project.find_by_kick_id(projectID);
      render_project(@project, true)
    end
  end

  def get_all_categories
    categories = Category.all
    render :ok, json: categories.to_json()
  end

  def get_all_sub_categories
    sub_categories = Subcategory.all
    render :ok, json: sub_categories.to_json(:include  => :category)
  end

  def get_all_users
    users = User.all
    render :ok, json: users.to_json()
  end

  def get_all_statuses
    statuses = Status.all
    render :ok, json: statuses.to_json()
  end

  def get_pledges_by_id
    projectID = params[:projectID]

    pledges = Pledge.where(:project_id => projectID)
    render :ok, json: pledges.to_json()

  end

  def get_all_dailies
    projectName = params[:projectID]

    all_dailies = get_dailies_by_kick_id(projectName)

    render :ok, json: all_dailies.to_json()
  end

  def get_trendline
    projectName = params[:projectID]

    all_dailies = get_dailies_by_kick_id(projectName)

    length_of_dailies = all_dailies.length
    array_of_coords = Array.new(length_of_dailies)

    all_dailies.each do | index, daily |
      array_of_coords[index] = Array.new(2)
      array_of_coords[index][0] = index
      array_of_coords[index][1] = daily.amount_pledged
    end

    render :ok, json: all_dailies.to_json()
  end
end
