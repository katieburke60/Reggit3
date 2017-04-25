Rails.application.routes.draw do
 # root to: ‘regulations#index’
 resources :followers, only: [:index]
 resources :accounts, only: [:index]
 resources :categories, only: [:index]
 resources :citizens, only: [:index, :show]
 resources :votes, only: [:show, :create]
 resources :comments, only: [:show, :create]
 resources :regulations, only: [:index, :show]
 resources :apicall, only: [:index]

 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
