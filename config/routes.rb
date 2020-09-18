Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  patch "/rooms/nonrelease/:id", to: "rooms#nonrelease"
  patch "/rooms/release/:id", to: "rooms#release"
  resources :rooms, only: [:index, :new, :create, :destroy, :show] do
    resources :items
  end
end
