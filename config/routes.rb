Rails.application.routes.draw do
  resources :products, only: %i[index show]

  get "/pages/:permalink", to: "pages#permalink", as: :permalink

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
