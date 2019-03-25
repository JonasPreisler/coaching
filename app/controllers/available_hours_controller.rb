class AvailableHoursController < ApplicationController
  before_action :set_available_hour, only: [:show, :edit, :update, :destroy]

  # GET /available_hours
  # GET /available_hours.json
  def index
    @available_hours = AvailableHour.where(from: params[:from]..params[:to])
  end

  # GET /available_hours/1
  # GET /available_hours/1.json
  def show
  end

  # GET /available_hours/new
  def new
    @available_hour = AvailableHour.new
  end

  # GET /available_hours/1/edit
  def edit
  end

  # POST /available_hours
  # POST /available_hours.json
  def create
    @available_hour = AvailableHour.new(available_hour_params)

    respond_to do |format|
      if @available_hour.save
        format.html { redirect_to @available_hour, notice: 'Available hour was successfully created.' }
        format.json { render :show, status: :created, location: @available_hour }
      else
        format.html { render :new }
        format.json { render json: @available_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /available_hours/1
  # PATCH/PUT /available_hours/1.json
  def update
    respond_to do |format|
      if @available_hour.update(available_hour_params)
        format.html { redirect_to @available_hour, notice: 'Available hour was successfully updated.' }
        format.json { render :show, status: :ok, location: @available_hour }
      else
        format.html { render :edit }
        format.json { render json: @available_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /available_hours/1
  # DELETE /available_hours/1.json
  def destroy
    @available_hour.destroy
    respond_to do |format|
      format.html { redirect_to available_hours_url, notice: 'Available hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_available_hour
      @available_hour = AvailableHour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def available_hour_params
      params.require(:available_hour).permit(:from, :to, :tutor_id)
    end
end
