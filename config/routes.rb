Rails.application.routes.draw do
  resources :tutors_documents
  resources :documents
  resources :reviews
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :tutors_categories
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
    get '/raadgiver/:id', to: 'tutors#show', as: :raadgiver
  end
  get '/ring', to: 'pages#ring'
  resources :tutors do
    resources :reviews
  end
  get '/ikke-godkendt', to: 'tutors#ikke_godkendt'
  put '/ikke-godkendt', to: 'tutors#ikke_godkendt'
  get '/tak-vent', to: 'pages#thank_you_pending'

  get "/404", :to => "errors#not_found", :via => :all
  get "/500", :to => "errors#internal_server_error", :via => :all



end
