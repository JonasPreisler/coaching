class ReviewsController < ApplicationController
  before_action :find_tutor
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!, only: [:new, :edit]

  def index
    @reviews = @tutor.reviews
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.account_id = current_account.id
    @review.tutor_id = @tutor.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to tutor_path(@tutor), notice: 'Anmeldelse ble opprettet.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to tutor_path(@tutor), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to tutor_path(@tutor), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def find_tutor
      @tutor = Tutor.friendly.find(params[:tutor_id])
    end

    def review_params
      params.require(:review).permit(:rating, :account_id, :tutor_id, :comment)
    end
end
