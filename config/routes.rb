Rails.application.routes.draw do
  # Routes for customers devise
  devise_for :customers

  as :customer do
    get "signup", to: "devise/registrations#new", as: "signup"
    post "signin" => "devise/sessions#create", as: "signin"
    delete "signout" => "devise/sessions#destroy", as: "signout"
  end

  # Routes for products
  resources :products, only: %i[index show] do
    collection do
      get "filter"
    end
  end

  get "men_products", to: "products#men_products", as: "men_products"
  get "women_products", to: "products#women_products", as: "women_products"

  # Routes for brands
  resources :brands, only: %i[index show]

  # Homepage
  root to: "products#index"

  # Active Admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Session Shopping Cart
  resources :cart, only: %i[create destroy index show]

  # Routes for Pages
  get ":permalink", to: "pages#permalink", as: :permalink
end
