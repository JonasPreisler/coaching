class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index

    if params.has_key?(:category)
      @category = Category.find_by_name(params[:category])
      @tutors_categories = TutorsCategory.where(category_id: @category)
      @tutors = Tutor.where(id: @tutors_categories).page(params[:page])
    else
      @categories = Category.all.left_joins(:tutors)
                      .group(:id)
                      .order('COUNT(tutors.id) DESC')
    end

    if params.has_key?(:sub_category)
      @sub_category = SubCategory.find_by_name(params[:sub_category])
      @tutors_categories = TutorsCategory.where(sub_category_id: @sub_category)
    end
    #@online_tutors = Tutor.where('approved = ? AND online = ?', true, true)
    #@sub_categories = SubCategory.joins(:tutor).group("sub_categories.tutor_id").order("count(sub_categories.tutor_id) desc")
    #@sub_categories = SubCategory.left_joins(:tutors)
    #                  .group(:id)
    #                  .order('COUNT(tutors.id) DESC')
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_category
      @category = Category.friendly.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :sub_category_id, :category_id, :first_name, :last_name, :current_password, :description, :phone, :email, :anonymous, :gdpr, :approved)
    end
end
