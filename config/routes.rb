Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
      resources :general_contractors
      resources :renovation_projects  
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end 
end
