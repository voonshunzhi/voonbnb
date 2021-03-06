Rails.application.routes.draw do
  get 'search/airbnb'
  get 'transactions/new'
  #As we sign in, the default page is pages#indec
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'airbnbs#index', as: :signed_in_root
  end

  #As we sign out,the default page is clearance/sessions#new
  constraints Clearance::Constraints::SignedOut.new do
    root to: 'clearance/sessions#new'
  end

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: "users", only: [:create,:edit] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :admins,only: [:index,:destroy,:update]
  resources :listings
  resources :users,only: [:edit,:update,:show]
  resources :airbnbs
  resources :reservations ,only:[:index]

  
  resources :airbnbs do
    resources :reservations,only: [:create]
  end

  post    'transactions/new'        => "transactions#new",as: :new_transaction
  post    'transactions/checkout'   => "transactions#checkout",as: :transactions_checkout
  get     "income"                   => "listings#income"
  get     "airbnbs/user/:id"         => "airbnbs#user_airbnbs",as: :user_airbnbs
  get     "profile"                  => "users#profile", as: :profile_page
  get     "/sign_in"                  => "clearance/sessions#new", as: "sign_in"
  delete  "/sign_out"                 => "clearance/sessions#destroy", as: "sign_out"
  get     "/sign_up"                  => "clearance/users#new", as: "sign_up"
  get     "/auth/:provider/callback"  => "sessions#create_from_omniauth"
  get     "search"             => "search#show",as: :search_for_place  
  get      "ajax/search"        =>  "search#airbnb"
end
