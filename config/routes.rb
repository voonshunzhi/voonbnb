Rails.application.routes.draw do

  #As we sign in, the default page is pages#indec
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'pages#index', as: :signed_in_root
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
  resources :listings
  resources :admin,only: [:index,:destroy]
  get "admin/approve/:id" => "admins#approve"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

end
