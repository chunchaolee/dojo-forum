Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # setup user
  resources :users, only: [:show, :edit, :update] do 

    member do 
      get :comments
      get :collects
      get :drafts
      get :friends
    end

  end

  # setup draft
  resources :drafts

  # setup post
  resources :posts do

    resources :replies, only: [:create, :edit, :update, :destroy]

    collection do
      get :feeds
    end

  end

  # setup category
  resources :categories, only: [:show]

  # setup friendship
  resources :friendships, only: [:create, :destroy]

  # setup collection
  resources :collections, only: [:create, :destroy]

  # admin
  namespace :admin do

    resources :categories, only: [:index, :create, :edit, :update, :destroy]
    resources :users , only: [:index, :destroy]

  end

  # feed


  root "posts#index"

end
