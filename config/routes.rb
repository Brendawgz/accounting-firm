Rails.application.routes.draw do

  resources :images
  devise_for :clients, controllers: { sessions: 'clients/sessions', registrations: 'clients/registrations', passwords: 'clients/passwords', confirmations: 'clients/confirmations'}
  devise_for :staffs, controllers: { sessions: 'staffs/sessions', registrations: 'staffs/registrations', passwords: 'staffs/passwords', confirmations: 'staffs/confirmations'}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index'

  # Example of regular route:
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'apply' => 'pages#apply'
  get 'updates' => 'pages#updates'
  get 'graduates' => 'pages#graduates'
  get 'promote' => 'pages#promote'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :teams  
  resources :tasks
  resources :subtasks
  resources :staffs, only: [:index, :show]
  resources :clients, only: [:index, :show]

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
