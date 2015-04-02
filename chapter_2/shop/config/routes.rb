Rails.application.routes.draw do
  # General
  # get 'home/welcome' => 'home#welcome', as: :welcome

  # Resources
  resources :products do
    resources :variants, shallow: true
    collection do
      get :top
    end
    member do
      get :buy
    end
  end

  # Profile
  resource :profile, only: [:show, :edit, :update]

  # Admin
  namespace :admin do
    resources :products do
      resources :variants
    end
  end

  # Comments
  concern :commentable do
    resources :comments
  end

  resources :messages, concerns: :commentable
  resources :articles, concerns: :commentable


  # Root
  root 'products#index'
end
