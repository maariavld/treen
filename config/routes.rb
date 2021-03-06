Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :brands, only: [ :new, :create, :show, :index ] do
    resources :reviews, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :dashboards, only:[ :index, :destroy]
  resources :favorite_brands, only: [:create, :destroy]
end
