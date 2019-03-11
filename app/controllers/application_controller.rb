class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :account_activity
  before_action :global

  def global
  	@categories = Category.all
  	@sub_categories = SubCategory.all
  end

  private

  def account_activity
    current_or_guest_account.try :touch
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:sub_category_id :category_id, ,:first_name, :last_name, :current_password, :description, :phone, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:sub_category_id :category_id, ,:first_name, :last_name, :current_password, :description, :phone, :email])
    #in keys you list all the input you want to accept.
  end
end
