Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users
  root 'users#index'
  
  mount LetterOpenerWeb::Engine, at: '/letter_opener'

  resources :users, only: [:index, :show] do
    resources :recipes, only: [:index, :show, :new, :create, :update, :destroy]
  end 
  resources :inventories, only: [:index, :new, :create, :show, :update, :destroy] 
  resources :public_recipes, only: [:index]
  
  resources :public_recipes, only: [:index, :show]

end
