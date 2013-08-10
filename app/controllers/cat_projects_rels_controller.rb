class CatProjectsRelsController < ApplicationController
  # GET /cat_projects_rels
  # GET /cat_projects_rels.json
  def index
    @cat_projects_rels = CatProjectsRel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cat_projects_rels }
    end
  end

  # GET /cat_projects_rels/1
  # GET /cat_projects_rels/1.json
  def show
    @cat_projects_rel = CatProjectsRel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cat_projects_rel }
    end
  end

  # GET /cat_projects_rels/new
  # GET /cat_projects_rels/new.json
  def new
    @cat_projects_rel = CatProjectsRel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cat_projects_rel }
    end
  end

  # GET /cat_projects_rels/1/edit
  def edit
    @cat_projects_rel = CatProjectsRel.find(params[:id])
  end

  # POST /cat_projects_rels
  # POST /cat_projects_rels.json
  def create
    @cat_projects_rel = CatProjectsRel.new(params[:cat_projects_rel])

    respond_to do |format|
      if @cat_projects_rel.save
        format.html { redirect_to @cat_projects_rel, notice: 'Cat projects rel was successfully created.' }
        format.json { render json: @cat_projects_rel, status: :created, location: @cat_projects_rel }
      else
        format.html { render action: "new" }
        format.json { render json: @cat_projects_rel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cat_projects_rels/1
  # PUT /cat_projects_rels/1.json
  def update
    @cat_projects_rel = CatProjectsRel.find(params[:id])

    respond_to do |format|
      if @cat_projects_rel.update_attributes(params[:cat_projects_rel])
        format.html { redirect_to @cat_projects_rel, notice: 'Cat projects rel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cat_projects_rel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cat_projects_rels/1
  # DELETE /cat_projects_rels/1.json
  def destroy
    @cat_projects_rel = CatProjectsRel.find(params[:id])
    @cat_projects_rel.destroy

    respond_to do |format|
      format.html { redirect_to cat_projects_rels_url }
      format.json { head :no_content }
    end
  end
end
