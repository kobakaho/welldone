Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root "static_pages#top"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :cloths, only: %i[new create index show edit update destroy] do
    collection do # idを伴わないパス
      get :favorites
      get :discarded
    end
    member do # idを伴うパス
      get :confirm_discard
      patch :discard
      delete :destroy_discarded
    end
  end

  resources :favorites, only: %i[create destroy]

  resources :categories, only: %i[get_children get_parents] do
    collection do
      get :get_parents, to: "categories#get_parents"
      get :get_children, to: "categories#get_children"
    end
  end

  resources :checklists, only: %i[new create show index edit update destroy] do
    resources :items, only: %i[ new create destroy ] do
      collection do
        post :new_original_item
      end
      member do
        delete "destroy_original_item/:id", to: "items#destroy_original_item", as: :destroy_original_item
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "static_pages/terms", to: "static_pages#terms", as: "terms"
  get "static_pages/policy", to: "static_pages#policy", as: "policy"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
end
