Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'shopping_list/index'
  devise_for :users
  root 'users#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener'

  resources :users, only: [:index, :show] do
  resources :inventories, only: [:index, :new, :create, :show, :update, :destroy] 
    resources :inventories, only: [:index, :new, :create, :show, :update, :destroy] 
    resources :recipes, only: [:index, :show, :new, :create, :update, :destroy] do 
      resources :recipe_foods, only: %i[new create edit update destroy]
    end 
    resources :shopping_lists, only: %i[index]
end 
  resources :public_recipes, only: [:index]
  
  resources :public_recipes, only: [:index, :show]

end
