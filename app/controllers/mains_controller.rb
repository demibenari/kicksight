class MainsController < ApplicationController
  def index
    respond_to do |format|
      @project = Project.find_by(0)

      format.html
      format.json { render json: @project }
    end

  end

  def get_projects
    @project = Project.new

    render json: @project
  end
end
