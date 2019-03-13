class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update, :destroy]

	def index
		if params[:approved] == "false"
      @tutors = Tutor.where(approved: false)
    else
      @tutors = Tutor.all
    end
	end

  def edit
  end
  def update
    respond_to do |format|
      if @tutor.update(tutor_params)
        format.html { redirect_to @tutor, notice: 'tutor was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutor }
      else
        format.html { render :edit }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  def ikke_godkendt
    @unapproved_tutors = Tutor.where(approved: false)
    if params[:commit]
      @tutor = Tutor.find_by_id(params[:id])
      @tutor.update_column(:approved, true)
      MailerTutor.tutor_approved(@tutor).deliver
      flash[:notice] = "#{@tutor.first_name} #{@tutor.last_name} er godkjent!"
    end
  end

	def show
	end


	private

    def set_tutor
      @tutor = Tutor.friendly.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end