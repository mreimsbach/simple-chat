Rails.application.routes.draw do
  root to: 'rooms#index'

  resources :rooms, only: [:new, :create, :show, :index]
  mount ActionCable.server => '/cable'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
