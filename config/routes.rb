Rails.application.routes.draw do
	get '/accounts', to: 'accounts#index'
  devise_for :accounts
  resources :sub_categories
  resources :categories
  root to: 'categories#index'
  get '/accounts/online', to: 'accounts#online'
end
