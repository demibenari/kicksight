Kicksight::Application.routes.draw do

  resources :users

  resources :subcategories

  resources :statuses

  resources :push_dates

  resources :projects

  resources :pledges

  resources :dailies

  resources :categories

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root :to => 'mains#index'

  get '/templates/:path.html' => 'templates#page', :constraints => { :path => /.+/  }

  resource :mains do
    get :get_projects, on: :collection
    get :get_project, on: :collection
    get :get_all_categories, on: :collection
    get :get_all_sub_categories, on: :collection
    get :get_all_users, on: :collection
    get :get_all_statuses, on: :collection
    get :get_pledges_by_id, on: :collection
    get :get_all_dailies, on: :collection
    get :daily_project_points, on: :collection
    get :get_trendline, on: :collection
  end

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
