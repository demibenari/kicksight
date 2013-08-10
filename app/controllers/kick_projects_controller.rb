class KickProjectsController < ApplicationController
  # GET /kick_projects
  # GET /kick_projects.json
  def index
    @kick_projects = KickProject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kick_projects }
    end
  end

  # GET /kick_projects/1
  # GET /kick_projects/1.json
  def show
    @kick_project = KickProject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kick_project }
    end
  end

  # GET /kick_projects/new
  # GET /kick_projects/new.json
  def new
    @kick_project = KickProject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kick_project }
    end
  end

  # GET /kick_projects/1/edit
  def edit
    @kick_project = KickProject.find(params[:id])
  end

  # POST /kick_projects
  # POST /kick_projects.json
  def create
    @kick_project = KickProject.new(params[:kick_project])

    respond_to do |format|
      if @kick_project.save
        format.html { redirect_to @kick_project, notice: 'Kick project was successfully created.' }
        format.json { render json: @kick_project, status: :created, location: @kick_project }
      else
        format.html { render action: "new" }
        format.json { render json: @kick_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kick_projects/1
  # PUT /kick_projects/1.json
  def update
    @kick_project = KickProject.find(params[:id])

    respond_to do |format|
      if @kick_project.update_attributes(params[:kick_project])
        format.html { redirect_to @kick_project, notice: 'Kick project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kick_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kick_projects/1
  # DELETE /kick_projects/1.json
  def destroy
    @kick_project = KickProject.find(params[:id])
    @kick_project.destroy

    respond_to do |format|
      format.html { redirect_to kick_projects_url }
      format.json { head :no_content }
    end
  end
end
