class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  layout 'home'

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
    @bookings_by_date = @bookings.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    #@order = Order.new
    @id = params[:tutor_id]
    @tutor = Tutor.friendly.find(@id)
    #@offers = @tutor.offers.order('minutes DESC')
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    #@tutor = Tutor.find(params[:id])
    #@booking.tutor = @tutor
    @account = current_account

    unless @account.customer?
      @account.update_column(:customer, true)
    end

    begin
      customer = Stripe::Customer.create(
        :email => @account.email, 
        :source  => params[:stripeToken]
      )

      @charge = Stripe::Charge.create(
        :customer  => customer.id,
        :amount => (@booking.sub_total.to_f * 100).to_i ,
        :description => @booking.token,
        :currency =>  'nok'
      )
    rescue Exception => e
      redirect_to checkout_path, notice:  e.message
    end


    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:account_id, :tutor_id, :start, :end, :time, :offer_id)
    end
end
