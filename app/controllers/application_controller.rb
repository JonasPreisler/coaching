class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :global

  def global
  	@categories = Category.all
  	#@sub_categories = SubCategory.all
    @tutors_pending = Tutor.where(approved: false).page(params[:page])
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:sub_category_id, :category_id, :first_name, :last_name, :current_password, :description, :phone, :email, :anonymous, :gdpr, :approved, :sub_category_id, :nickname, :job_title, :profile_picture, :business_type, :private, :company, documents_attributes: [:id, :file, :_destroy, :tutor_id], active_hours_attributes: [:id, :_destroy, :start, :end, :tutor_id]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:sub_category_id, :category_id, :first_name, :last_name, :current_password, :description, :phone, :email, :anonymous, :gdpr, :approved, :sub_category_id, :nickname, :job_title, :profile_picture, :business_type, :private, :company, documents_attributes: [:id, :file, :_destroy, :tutor_id], active_hours_attributes: [:id, :_destroy, :start, :end, :tutor_id]])
    #in keys you list all the input you want to accept.
  end


end
