Rails.application.routes.draw do

  root 'posts#index'
  
  resources :posts do
    resources :comments
    resources :charges
  end

  resources :tags do
    resources :posts
  end


end
