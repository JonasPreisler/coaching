class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update, :destroy]
  before_action :check_if_approved, only: [:show]
  before_action :check_admin, only: :tutors_pending_approval
  impressionist :actions=>[:show]

	def index
		#f params[:approved] == "false"
    # @tutors = Tutor.where('approved = ? AND online = ?', false, true)
    #lse
    # @tutors = Tutor.where(approved: true)
    #nd
    #date = params[:date] ? Date.parse(params[:date]) : Date.today
	end

  def edit
  end

  def tutors_pending_approval
    @pending_tutors = Tutor.pending.page(params[:page])


    if params[:unapproved_tutors].present?
      @unapproved_tutors = Tutor.find(params[:unapproved_tutors])
      @unapproved_tutors.each do |unapproved_tutor|
        unapproved_tutor.unapproved!       
      end
    end
    if params[:approved_tutors].present?
      @approved_tutors = Tutor.find(params[:approved_tutors])
      @approved_tutors.each do |approved_tutor|
        approved_tutor.approved!
        #MailerTutor.tutor_approved(@tutor).deliver
      end
    end

    render layout: 'home'
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
      unless @tutor.approved?
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
      params.require(:category).permit(:sub_category_id, :category_id, :first_name, :last_name, :current_password, :description, :phone, :email, :anonymous, :gdpr, :approved, :sub_category_id, :nickname, :job_title, :profile_picture, :business_type, :private, :company, documents_attributes: [:id, :file, :_destroy, :tutor_id], active_hours_attributes: [:id, :_destroy, :start, :end, :tutor_id])
    end
end