require 'resque/server'
Rails.application.routes.draw do

  get 'patient/patient_home'

devise_for :users, controllers: {sessions: "sessions"}

  #devise_for :users, :controllers => {:registrations => "registrations"}



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # mount the API Server

  # mount Swagger Documentation for API Server

  mount GrapeSwaggerRails::Engine => '/documentation'

  # mount redis/resque monitoring interface
  mount Resque::Server.new, at: "/resque"



  root to: "pages#home"
  match '/patient',to: 'patient#patient_home',via:[:get,:post]
  get '/doctor', to: 'pages#doctor', as: :doctor
  match '/registration',to: 'registrations#create',via:[:get,:post]
  get '/confirm_email', to: 'pages#confirm_email' 
  match '/email_inbox',to: 'pages#email_inbox',via:[:get,:post] 
  match '/edit_password',to: 'pages#edit_password',via:[:get,:post]
  match '/passwordreset',to: 'pages#passwordreset',via:[:get,:post]
  match '/create_count',to: 'pages#create_count',via:[:get,:post]
  match '/daily_report',to: 'patient#daily_report',via:[:get,:post]
  match '/monthto_date',to: 'patient#monthto_date',via:[:get,:post]
  match '/monthly_report',to: 'patient#monthly_report',via:[:get,:post]

  
  
  


  
  resources :pages, only: [:new, :create, :destroy]
  resources :patient, only: [:new, :create, :destroy]






  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
