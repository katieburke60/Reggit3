
Rails.application.routes.draw do
 # root to: ‘regulations#index’
 # resources :accounts, only: [:index]
 resources :votes, only: [:show, :create]
 resources :comments, only: [:create]
 resources :actions, only: [:index, :show]
 resources :sessions, only: [:create]
 resources :citizens, only: [:index]
 resources :registrations, only: [:create]
 resources :categories, only: [:index]
 # resources :action_follows, only: [:show]

 post '/actions/:id/action_follow', to: 'actions#create_action_follow', as: 'action_follow'
 post '/actions/:id/action_follow/cancel', to: 'actions#destroy_action_follow', as: 'unfollow'

end
