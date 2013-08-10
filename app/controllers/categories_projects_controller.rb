class CategoriesProjectsController < ApplicationController
  # GET /categories_projects
  # GET /categories_projects.json
  def index
    @categories_projects = CategoriesProjects.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories_projects }
    end
  end

  # GET /categories_projects/1
  # GET /categories_projects/1.json
  def show
    @categories_project = CategoriesProjects.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @categories_project }
    end
  end

  # GET /categories_projects/new
  # GET /categories_projects/new.json
  def new
    @categories_project = CategoriesProjects.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @categories_project }
    end
  end

  # GET /categories_projects/1/edit
  def edit
    @categories_project = CategoriesProjects.find(params[:id])
  end

  # POST /categories_projects
  # POST /categories_projects.json
  def create
    @categories_project = CategoriesProjects.new(params[:categories_project])

    respond_to do |format|
      if @categories_project.save
        format.html { redirect_to @categories_project, notice: 'Categories projects was successfully created.' }
        format.json { render json: @categories_project, status: :created, location: @categories_project }
      else
        format.html { render action: "new" }
        format.json { render json: @categories_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories_projects/1
  # PUT /categories_projects/1.json
  def update
    @categories_project = CategoriesProjects.find(params[:id])

    respond_to do |format|
      if @categories_project.update_attributes(params[:categories_project])
        format.html { redirect_to @categories_project, notice: 'Categories projects was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @categories_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories_projects/1
  # DELETE /categories_projects/1.json
  def destroy
    @categories_project = CategoriesProjects.find(params[:id])
    @categories_project.destroy

    respond_to do |format|
      format.html { redirect_to categories_projects_index_url }
      format.json { head :no_content }
    end
  end
end
