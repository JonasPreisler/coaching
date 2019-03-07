class ApplicationController < ActionController::Base
  after_action :account_activity
  before_action :global

  def global
  	@categories = Category.all
  	@sub_categories = SubCategory.all
  end

  private

  def account_activity
    current_account.try :touch
  end
end
