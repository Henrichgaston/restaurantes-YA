Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'forgot', confirmation: 'confirm', unlock: 'unlock', registration: 'register', sign_up: 'signup' }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants do
    resources :foods, only: [:new, :create]
    resources :schedules, only: [:new, :create]
  end
  get "my_restaurants", to: "restaurants#my_restaurants"
    # Siempre que exista un elemento que depende de otro -en este caso foods depende de restaurants-, debemos codear un nested resource. Una comida le pertenece a un restaurante y un restaurante a un usuario. En los nested resources solo necesito las acciones new y create.
  resources :foods, except: [:new, :create]
  resources :schedules, except: [:new, :create]
end
