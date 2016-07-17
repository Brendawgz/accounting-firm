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
  get 'graduates' => 'pages#graduates'
  get 'why_you_should_choose_us' => 'pages#why_you_should_choose_us'
  get 'audit_and_assurance' => 'pages#audit_and_assurance'
  get 'bookkeeping' => 'pages#bookkeeping'
  get 'consulting' => 'pages#consulting'
  get 'taxation' => 'pages#taxation'
  get 'updates' => 'pages#updates'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :teams  
  get 'team_search' => 'teams#search'
  resources :tasks
  get 'task_search' => 'tasks#search'
  resources :subtasks
  get 'subtask_search' => 'subtasks#search'
  get 'team_tasks' => 'subtasks#team_tasks'
  get 'my_tasks' => 'subtasks#my_tasks'
  resources :staffs
  get 'staff_search' => 'staffs#search'
  resources :clients
  get 'client_search' => 'clients#search'

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
