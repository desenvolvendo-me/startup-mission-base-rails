Rails.application.routes.draw do
  devise_for :admin_users,
             ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :manager do
    resources :goals
    namespace :goals do
      namespace :done do
        post :index
        post :show
        post :many
      end
    end

    get '', to: 'home#index', as: :home
  end

  scope module: :external do
    get '', to: 'home#index', as: :home
    get 'stimulus', to: 'home#stimulus', as: :stimulus
  end
end
