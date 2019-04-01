# frozen_string_literal: true

class Tutors::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @sub_categories = SubCategory.all.order('name ASC')
    super
  end

  def create
    super do
      if @tutor.persisted?
        asign_sub_categories if params[:sub_category_ids]

        create_company
      end
    end
  end

  private

  def asign_sub_categories
    params[:sub_category_ids].each { |id| @tutor.tutors_categories.create(sub_category_id: id) }
  end

  def create_company
    @tutor.create_company(organization_number:       params[:organization_number],
                          name:                      params[:company_name],
                          company_type:              params[:company_type],
                          address:                   params[:company_address],
                          contact_person_first_name: params[:contact_person_first_name],
                          contact_person_last_name:  params[:contact_person_last_name])
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    tak_vent_path
  end

  # def after_sign_up_path_for(resource)
  #   tak_vent_path
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
