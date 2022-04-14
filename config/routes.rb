Rails.application.routes.draw do
  get 'shopping_lists/index'
  devise_for :users

  # Defines the root path route ("/")
  devise_scope :user do
    authenticated :user do
      root :to => "foods#index", as: :authenticated_root
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
    unauthenticated :user do
      root :to => "devise/sessions#new", as: :unauthenticated_root
    end
  end

  # Defines the routes for the Users controller
  resources :users, only: [:index]
  resources :foods, except: [:update]
  resources :public_recipes,except: [:update]

  resources :recipes, except: [:update] do
    resources :recipe_foods, only: [:create, :destroy]
  end

  # Defines the routes for the inventory and inventory_foods controller
  resources :inventories, except: %i[update] do
    resources :inventory_foods, only: %i[new create destroy]
  end 
end
