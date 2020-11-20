Rails.application.routes.draw do
  # Routes for products
  resources :products, only: %i[index show]
  get "men_products", to: "products#men_products", as: "men_products"
  get "women_products", to: "products#women_products", as: "women_products"

  # Routes for Pages
  get ":permalink", to: "pages#permalink", as: :permalink

  # Homepage
  root to: "products#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
