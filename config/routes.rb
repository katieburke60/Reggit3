
Rails.application.routes.draw do
 # root to: ‘regulations#index’
 resources :accounts, only: [:index]
 resources :votes, only: [:show, :create]
 resources :comments, only: [:create]
 resources :actions, only: [:index, :show]
 resources :sessions, only: [:create]
 resources :registrations, only: [:create]
 resources :categories, only: [:index]

end
