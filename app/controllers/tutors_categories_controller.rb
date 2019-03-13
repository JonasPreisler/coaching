class TutorsCategoriesController < ApplicationController
  before_action :set_tutors_category, only: [:show, :edit, :update, :destroy]

  # GET /tutors_categories
  # GET /tutors_categories.json
  def index
    @tutors_categories = TutorsCategory.all
  end

  # GET /tutors_categories/1
  # GET /tutors_categories/1.json
  def show
  end

  # GET /tutors_categories/new
  def new
    @tutors_category = TutorsCategory.new
  end

  # GET /tutors_categories/1/edit
  def edit
  end

  # POST /tutors_categories
  # POST /tutors_categories.json
  def create
    @tutors_category = TutorsCategory.new(tutors_category_params)

    respond_to do |format|
      if @tutors_category.save
        format.html { redirect_to @tutors_category, notice: 'Tutors category was successfully created.' }
        format.json { render :show, status: :created, location: @tutors_category }
      else
        format.html { render :new }
        format.json { render json: @tutors_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutors_categories/1
  # PATCH/PUT /tutors_categories/1.json
  def update
    respond_to do |format|
      if @tutors_category.update(tutors_category_params)
        format.html { redirect_to @tutors_category, notice: 'Tutors category was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutors_category }
      else
        format.html { render :edit }
        format.json { render json: @tutors_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutors_categories/1
  # DELETE /tutors_categories/1.json
  def destroy
    @tutors_category.destroy
    respond_to do |format|
      format.html { redirect_to tutors_categories_url, notice: 'Tutors category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutors_category
      @tutors_category = TutorsCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutors_category_params
      params.require(:tutors_category).permit(:tutor_id, :sub_category_id)
    end
end
