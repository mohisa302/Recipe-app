Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  devise_for :users
  root 'users#index'

  post '/inventory_foods', to: 'inventory_foods#create', as: 'create_inventory_food'
  delete '/inventory_foods', to: 'inventory_foods#destory', as: 'delete_inventory_food'

  post '/inventories', to: 'inventories#create', as: 'create_inventory'

  
  mount LetterOpenerWeb::Engine, at: '/letter_opener'

  resources :users, only: [:index, :show] do
    resources :recipes, only: [:index, :show, :new, :create, :update, :destroy]
  end 
  resources :inventories, only: [:index, :new, :create, :show, :update, :destroy] do
    resources :inventory_foods, only: [:create, :delete, :new]
  end

  resources :inventory_foods, only: [:create, :destroy, :new]

  get 'shopping_list/index'

  resources :users, only: [:index, :show] do
    resources :foods, only: %i[index show new create destroy]
    resources :recipes, only: [:index, :show, :new, :create, :update, :destroy] do 
      resources :recipe_foods, only: %i[new create edit update destroy]
    end 
    resources :shopping_lists, only: %i[index]
end 
  resources :public_recipes, only: [:index]
  
  resources :public_recipes, only: [:index, :show]

end
