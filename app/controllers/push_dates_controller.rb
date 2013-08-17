class PushDatesController < ApplicationController
  before_action :set_push_date, only: [:show, :edit, :update, :destroy]

  # GET /push_dates
  # GET /push_dates.json
  def index
    @push_dates = PushDate.all
  end

  # GET /push_dates/1
  # GET /push_dates/1.json
  def show
  end

  # GET /push_dates/new
  def new
    @push_date = PushDate.new
  end

  # GET /push_dates/1/edit
  def edit
  end

  # POST /push_dates
  # POST /push_dates.json
  def create
    @push_date = PushDate.new(push_date_params)

    respond_to do |format|
      if @push_date.save
        format.html { redirect_to @push_date, notice: 'Push date was successfully created.' }
        format.json { render action: 'show', status: :created, location: @push_date }
      else
        format.html { render action: 'new' }
        format.json { render json: @push_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /push_dates/1
  # PATCH/PUT /push_dates/1.json
  def update
    respond_to do |format|
      if @push_date.update(push_date_params)
        format.html { redirect_to @push_date, notice: 'Push date was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @push_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /push_dates/1
  # DELETE /push_dates/1.json
  def destroy
    @push_date.destroy
    respond_to do |format|
      format.html { redirect_to push_dates_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_push_date
    @push_date = PushDate.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def push_date_params
    params.require(:push_date).permit(:push_date)
  end
end
