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
      get "filter", "search"
    end
  end

  get "men_products", to: "products#men_products", as: "men_products"
  get "women_products", to: "products#women_products", as: "women_products"

  # Routes for brands
  resources :brands, only: %i[index show]

  # Routes for carts
  resources :carts, only: %i[index]

  # Routes for cart_products
  resources :cart_products, only: %i[create destroy update]

  # Routes for checkout
  resources :checkout, only: %i[index update]

  # Routes for orders
  resources :orders, only: %i[index show]

  # Routes for order_products
  resources :order_product, only: %i[create]

  # Homepage
  root to: "products#index"

  # Active Admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Routes for Pages
  get ":permalink", to: "pages#permalink", as: :permalink
end
