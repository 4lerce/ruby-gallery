Rails.application.routes.draw do
  get "images/index"
  get "images/create"
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root "images#index", as: :authenticated_root
      resources :images, only: [ :index, :create, :destroy, :show, :edit, :update ]
    end

    unauthenticated do
      root "devise/sessions#new", as: :unauthenticated_root
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "devise/sessions#newx"
end
