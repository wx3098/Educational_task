Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  namespace :admin do
    resources :users
  end
  resources :tasks do
    collection do
      post :confirm
    end
  end
end
# post '/admin/users/new', to: 'admin/users#create'
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html