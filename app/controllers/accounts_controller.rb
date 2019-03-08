class AccountsController < ApplicationController
	def index
		@accounts = Account.all
	end

	def create
		@account = params[:account] ? Account.new(params[:user]) : Account.new_guest
		if @account.save
			session[:account_id] = @account.id
			redirect_to root_url
		else
			render 'new'
		end
	end
end