class ApplicationController < ActionController::Base
  after_action :account_activity

  private

  def account_activity
    current_account.try :touch
  end
end
