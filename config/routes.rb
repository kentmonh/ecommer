Rails.application.routes.draw do
  resources :products, only: %i[index show]

  # Routes for Pages
  get ":permalink", to: "pages#permalink", as: :permalink

  # Homepage
  root to: "products#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
