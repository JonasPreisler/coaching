class ActiveHoursController < ApplicationController
  before_action :set_active_hour, only: [:show, :edit, :update, :destroy]

  # GET /active_hours
  # GET /active_hours.json
  def index
    @active_hours = ActiveHour.where(from: params[:from]..params[:to])
  end

  # GET /active_hours/1
  # GET /active_hours/1.json
  def show
  end

  # GET /active_hours/new
  def new
    @active_hour = ActiveHour.new
  end

  # GET /active_hours/1/edit
  def edit
  end

  # POST /active_hours
  # POST /active_hours.json
  def create
    @active_hour = ActiveHour.new(active_hour_params)

    respond_to do |format|
      if @active_hour.save
        format.html { redirect_to @active_hour, notice: 'active hour was successfully created.' }
        format.json { render :show, status: :created, location: @active_hour }
      else
        format.html { render :new }
        format.json { render json: @active_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /active_hours/1
  # PATCH/PUT /active_hours/1.json
  def update
    respond_to do |format|
      if @active_hour.update(active_hour_params)
        format.html { redirect_to @active_hour, notice: 'active hour was successfully updated.' }
        format.json { render :show, status: :ok, location: @active_hour }
      else
        format.html { render :edit }
        format.json { render json: @active_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /active_hours/1
  # DELETE /active_hours/1.json
  def destroy
    @active_hour.destroy
    respond_to do |format|
      format.html { redirect_to active_hours_url, notice: 'active hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_active_hour
      @active_hour = ActiveHour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def active_hour_params
      params.require(:active_hour).permit(:start, :end, :tutor_id)
    end
end