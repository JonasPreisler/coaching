class AccountsController < ApplicationController
  before_action :set_account, only: [:show]

	def index
		@accounts = Account.all
	end

	def show
		@bookings = @account.bookings
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

	private


    def set_account
      @account = Account.find(params[:id])
    end
end