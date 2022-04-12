Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    authenticated :user do
      root :to => "users#index", as: :authenticated_root
    end
    unauthenticated :user do
      root :to => "devise/sessions#new", as: :unauthenticated_root
    end
  end

  # Defines the routes for the Users controller
  resources :users, only: [:index]
  resources :foods, except: [:update]
  resources :recipes, except: [:update]
end
