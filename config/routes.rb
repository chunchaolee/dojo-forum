Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # setup user
  resources :users, only: [:show, :edit]

  # setup post
  resources :posts do

    resources :replies, only: [:create, :destroy]

    collection do
      get :feeds
    end

  end

  # setup draft
  resources :drafts

  # setup friendship
  resources :friendships, only: [:create, :destroy]

  # admin
  namespace :admin do

    resources :categories
    resources :users

  end

  # feed


  root "posts#index"

end
