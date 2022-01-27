Rails.application.routes.draw do
  devise_for :users

  get 'friend_request/accept_request/:by_id', to: 'friend_request#accept_request'
  get 'friend_request/send_request/:to_id', to: 'friend_request#send_request'

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end

  resources :profiles, only: [:index]
  get 'profiles/:username', to: 'profiles#show', as: :profile

  resources :photos, only: [:index, :show, :new, :create, :destroy]

  resources :comments, only: [:create, :edit, :update, :destroy]

  root 'photos#index'

  get '*path', to: 'photos#index', constraints: lambda { |req| req.path.exclude? 'rails/active_storage' }

  
end
