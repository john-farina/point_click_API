Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end

  # Serve Static Build Files
  get '/:file_name', to: 'static_files#serve'

  root "users#index"

  scope '/api' do
    post "/user", to: "users#create"
    post "/user/sign_in", to: "users#new"
    get "/sign_out" => "sessions#destroy", as: "sign_out"

    post '/is_signed_in', to: "users#show_signed_in"
    post '/user/info', to: "api#get_player_info"
    post '/user/update' => "api#update_player_info"
  end
end
