class DailyPledgesController < ApplicationController
  # GET /daily_pledges
  # GET /daily_pledges.json
  def index
    @daily_pledges = DailyPledge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @daily_pledges }
    end
  end

  # GET /daily_pledges/1
  # GET /daily_pledges/1.json
  def show
    @daily_pledge = DailyPledge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @daily_pledge }
    end
  end

  # GET /daily_pledges/new
  # GET /daily_pledges/new.json
  def new
    @daily_pledge = DailyPledge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @daily_pledge }
    end
  end

  # GET /daily_pledges/1/edit
  def edit
    @daily_pledge = DailyPledge.find(params[:id])
  end

  # POST /daily_pledges
  # POST /daily_pledges.json
  def create
    @daily_pledge = DailyPledge.new(params[:daily_pledge])

    respond_to do |format|
      if @daily_pledge.save
        format.html { redirect_to @daily_pledge, notice: 'Daily pledge was successfully created.' }
        format.json { render json: @daily_pledge, status: :created, location: @daily_pledge }
      else
        format.html { render action: "new" }
        format.json { render json: @daily_pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /daily_pledges/1
  # PUT /daily_pledges/1.json
  def update
    @daily_pledge = DailyPledge.find(params[:id])

    respond_to do |format|
      if @daily_pledge.update_attributes(params[:daily_pledge])
        format.html { redirect_to @daily_pledge, notice: 'Daily pledge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @daily_pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_pledges/1
  # DELETE /daily_pledges/1.json
  def destroy
    @daily_pledge = DailyPledge.find(params[:id])
    @daily_pledge.destroy

    respond_to do |format|
      format.html { redirect_to daily_pledges_url }
      format.json { head :no_content }
    end
  end
end
