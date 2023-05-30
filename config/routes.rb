Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :inventories, only: [:index, :new, :create, :show, :update, :destroy] 
    resources :recipes, only: [:index, :show, :new, :create, :update, :destroy]
  end 
  
  resources :public_recipes, only: [:index]

end

  