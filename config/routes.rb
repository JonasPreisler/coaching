Rails.application.routes.draw do
  resources :products
  get 'rooms/show'
	get '/accounts', to: 'accounts#index'
  devise_for :accounts, path: 'accounts', controllers: { sessions: "accounts/sessions", registrations: "accounts/registrations", confirmations: "accounts/confirmations", passwords: "accounts/passwords", unlocks: "accounts/unlocks" }
  resources :sub_categories
  resources :categories
  get '/home', to: 'pages#home'
  get '/contact1', to: 'pages#contact1'
  get '/contact2', to: 'pages#contact2'
  get '/veiledere', to: 'pages#veiledere'
  get '/mobil', to: 'pages#mobil'
  get '/mobil2', to: 'pages#mobil2'
  root to: 'pages#landing_page'
  get '/accounts/online', to: 'accounts#online'
  mount ActionCable.server => '/cable'

  devise_for :tutors, path: 'tutors', controllers: { sessions: "tutors/sessions", registrations: "tutors/registrations", confirmations: "tutors/confirmations", passwords: "tutors/passwords", unlocks: "tutors/unlocks" }
  devise_scope :tutor do
    get '/logg-in', to: 'tutors/sessions#new'
    post '/logg-in', to: 'tutors/sessions#create'
    get '/veileder/ny', to: 'tutors/registrations#new'
    post '/veileder/ny', to: 'tutors/registrations#create'
  end
end
