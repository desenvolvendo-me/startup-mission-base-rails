Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :manager do
    resources :goals
    get '', to: "home#index", as: :home
  end

  scope module: :external do
    get '', to: "home#index", as: :home
  end
end
