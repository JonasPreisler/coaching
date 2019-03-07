Rails.application.routes.draw do
  get 'rooms/show'
	get '/accounts', to: 'accounts#index'
  devise_for :accounts
  resources :sub_categories
  resources :categories
  get '/home', to: 'pages#home'
  get '/contact1', to: 'pages#contact1'
  get '/contact2', to: 'pages#contact2'
  get '/terapeuter', to: 'pages#terapeuter'
  root to: 'categories#index'
  get '/accounts/online', to: 'accounts#online'
  mount ActionCable.server => '/cable'
end
