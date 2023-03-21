Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end

  # Defines the root path route ("/")
  root "users#index"
  get '/:file_name', to: 'static_files#serve'
  # get "/api/is_signed_in", to: "users#show_signed_in"

  scope '/api' do
    post "/user", to: "users#create"
    post "/user/sign_in", to: "users#new"
    get "/sign_out" => "sessions#destroy", as: "sign_out"

    post '/is_signed_in', to: "users#show_signed_in"
  end
end
