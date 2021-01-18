Rails.application.routes.draw do
  resources :announcements do
    resources :comments
  end
  devise_for :users

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end

  get 'overview', to:'static#overview', as: :overview
  get 'safety', to:'static#safety', as: :safety
  
  root to: 'static#overview'
end
