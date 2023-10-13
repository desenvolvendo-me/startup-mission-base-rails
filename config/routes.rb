Rails.application.routes.draw do

  namespace :manager do
    resources :posts
    get '', to: "home#index", as: :home
  end

  scope module: :external do
    get '', to: "home#index", as: :home
  end
end
