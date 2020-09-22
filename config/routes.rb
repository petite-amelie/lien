Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "rooms#index"
  patch "/rooms/nonrelease/:id", to: "rooms#nonrelease"
  patch "/rooms/release/:id", to: "rooms#release"
  get "/users/profile/:id", to: "users#profile"
  get "/users/like/:id", to: "users#like"
  get "/rooms/genre", to: "rooms#genre"
  resources :rooms, only: [:index, :new, :create, :destroy, :show] do
    resources :items do
      resources :orders, only: [:index, :new, :create]
    end
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show]
end
