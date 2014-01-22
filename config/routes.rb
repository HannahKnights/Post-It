Rails.application.routes.draw do

  root 'posts#index'
  
  devise_for :admins
  devise_for :users

  resources :posts do
    resources :comments
    resources :charges
  end

  resources :tags do
    resources :posts
  end


end
