Rails.application.routes.draw do



 # root to: ‘regulations#index’
 # resources :followers, only: [:index]
 # resources :accounts, only: [:index]
 # resources :categories, only: [:index]
 resources :citizens, only: [:index, :show]


 resources :apicall, only: [:index]
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 namespace :v1 do
   resources :regulations, only: [:index, :show]
   resources :comments, only: [:index,:show,:create]
   resources :sessions, only: [:create]
   resources :votes, only: [:index,:show,:create]
 end

end
