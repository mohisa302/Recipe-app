Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'shopping_list/index'
  devise_for :users
  root 'users#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener'

  resources :users, only: [:index, :show] do
    resources :foods, only: %i[index show new create destroy]
    resources :inventories, only: [:index, :new, :create, :show, :update, :destroy] 
    resources :recipes, only: [:index, :show, :new, :create, :update, :destroy] do 
      member do
        get 'generate_shopping_list'
        post 'make_list'
      end
      resources :recipe_foods, only: %i[new create edit update destroy]
    end 
    resources :shopping_list, only: %i[index new create]

  end 

  resources :public_recipes, only: [:index, :show]
  get '/make_list', to: 'shopping_list#make_list', as: 'make_list'
  get '/recipes/:recipe_id/generate', to: 'shopping_list#generate_shopping_list', as: 'generate_shopping_list'
  get 'recipes/:recipe_id/new', to: 'shopping_list#new', as: 'new_user_recipe_shopping_list'
end
