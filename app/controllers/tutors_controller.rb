class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update, :destroy]
  before_action :check_if_approved, only: [:show]
  before_action :check_admin, only: :tutors_pending_approval

	def index
		if params[:approved] == "false"
      @tutors = Tutor.where('approved = ? AND online = ?', false, true)
    else
      @tutors = Tutor.all
    end
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
	end

  def edit
  end

  def tutors_pending_approval
    @unapproved_tutors = Tutor.where(approved: false)
    if params[:commit]
      @tutor = Tutor.find_by_id(params[:id])
      @tutor.update_column(:approved, true)
      MailerTutor.tutor_approved(@tutor).deliver
      flash[:notice] = "#{@tutor.first_name} #{@tutor.last_name} er godkjent!"
    end
  end

	def show
    if @tutor.reviews.blank?
      @average_review = 0
    else
      @average_review = @tutor.reviews.average(:rating).round(2)
    end
    @documents = Document.where(tutor_id: @tutor)
    @reviews = @tutor.reviews.order('created_at DESC').page(params[:page])
	end

	private

    def check_if_approved
      if @tutor.approved == false
        redirect_to root_path
      end
    end

    def check_admin
      unless tutor_signed_in? && current_tutor.admin?
        flash[:notice] = 'Denne siden er bare tilgjengelig for administratorer.'
        redirect_to root_path
      end
    end

    def set_tutor
      @tutor = Tutor.friendly.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:sub_category_id, :category_id, :first_name, :last_name, :current_password, :description, :phone, :email, :anonymous, :gdpr, :approved, :sub_category_id, :profile_picture)
    end
end