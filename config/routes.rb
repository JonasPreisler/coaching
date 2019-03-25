Rails.application.routes.draw do
  resources :available_hours
  resources :companies
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
    get  '/logg-in',       to: 'tutors/sessions#new'
    post '/logg-in',       to: 'tutors/sessions#create'
    get  '/veileder/ny',   to: 'tutors/registrations#new'
    post '/veileder/ny',   to: 'tutors/registrations#create'
    get  '/raadgiver/:id', to: 'tutors#show', as: :raadgiver
  end
  get 'kontrakt', to: 'pages#contract'
  get 'download-kontrakt', to: 'pages#download_contract'
  get '/ring', to: 'pages#ring'
  
  get 'raadgiver/:id/book', to: 'bookings#new', as: :tutor
  post 'raadgiver/:id/book', to: 'bookings#create'

  resources :tutors do
    resources :bookings
    resources :reviews
  end
  get '/indstillinger', to: 'settings#index'
  get '/venter-pa-godkjenning', to: 'tutors#tutors_pending_approval'
  put '/venter-pa-godkjenning', to: 'tutors#tutors_pending_approval'
  get '/tak-vent', to: 'pages#thank_you_pending'

  get "/404", :to => "errors#not_found", :via => :all
  get "/500", :to => "errors#internal_server_error", :via => :all
  get "home/download_pdf"
end
