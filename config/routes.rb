Rails.application.routes.draw do

  namespace :manager do
    resources :goals
    get '', to: "home#index", as: :home
  end

  scope module: :external do
    get '', to: "home#index", as: :home
  end
end
