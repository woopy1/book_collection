Rails.application.routes.draw do
  root "main#index"
  get "main/index"
  post "main/index", to: "main#create"
  get "books/new", to: "main#new", as: :new_book
  get "books/:id", to: "main#show", as: :book
  get "books/:id/edit", to: "main#edit", as: :edit_book
  patch "books/:id", to: "main#update"
  put "books/:id", to: "main#update"
  delete "books/:id", to: "main#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  match 'about', to: 'main#about', via: :get
  match 'hello', to: 'main#hello', via: :get
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "index", to: "main#index", via: :get
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
