Rails.application.routes.draw do

  resources :posts
  
  root 'posts#index'
  get 'dashboard' => 'posts_dash#index'
  
end
