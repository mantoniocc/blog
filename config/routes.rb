Rails.application.routes.draw do
  
  root 'posts#index'
  get 'dashboard' => 'posts_dash#index'

  resources :posts do
  	resources :comments, only: [:create, :destroy] do
  		resources :replies, only: [:create, :destroy]
  	end
  end
  
end
