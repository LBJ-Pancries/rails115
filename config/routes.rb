Rails.application.routes.draw do
  devise_for :users
  resources :groups do
    member do
      post :join
      post :quit
    end
    collection do
      get :search
    end
    resources :posts
  end

  namespace :account do
    resources :groups
    resources :posts
  end
  # root 'welcome#index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
