class KickCategoriesController < ApplicationController
  # GET /kick_categories
  # GET /kick_categories.json
  def index
    @kick_categories = KickCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kick_categories }
    end
  end

  # GET /kick_categories/1
  # GET /kick_categories/1.json
  def show
    @kick_category = KickCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kick_category }
    end
  end

  # GET /kick_categories/new
  # GET /kick_categories/new.json
  def new
    @kick_category = KickCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kick_category }
    end
  end

  # GET /kick_categories/1/edit
  def edit
    @kick_category = KickCategory.find(params[:id])
  end

  # POST /kick_categories
  # POST /kick_categories.json
  def create
    @kick_category = KickCategory.new(params[:kick_category])

    respond_to do |format|
      if @kick_category.save
        format.html { redirect_to @kick_category, notice: 'Kick category was successfully created.' }
        format.json { render json: @kick_category, status: :created, location: @kick_category }
      else
        format.html { render action: "new" }
        format.json { render json: @kick_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kick_categories/1
  # PUT /kick_categories/1.json
  def update
    @kick_category = KickCategory.find(params[:id])

    respond_to do |format|
      if @kick_category.update_attributes(params[:kick_category])
        format.html { redirect_to @kick_category, notice: 'Kick category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kick_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kick_categories/1
  # DELETE /kick_categories/1.json
  def destroy
    @kick_category = KickCategory.find(params[:id])
    @kick_category.destroy

    respond_to do |format|
      format.html { redirect_to kick_categories_url }
      format.json { head :no_content }
    end
  end
end
