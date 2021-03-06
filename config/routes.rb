SMU::Application.routes.draw do




  get "dashboard/index"
  get "group_schedules/index"
  get "group_schedules/new/:id", :controller => "group_schedules", :action => "new", as: "group_schedule_new"
  get "group_schedules/edit"
  get "group_schedules/create"
  patch "group_schedules/update"

  resources :addresses

  resources :organizations

  resources :schedules

  resources :groups

  devise_for :users
  scope :admin do
    resources :users
  end

  get "/about_us" => "home#about"
  get "/contact_us" => "home#contact"
  get "/help" => "home#help"

  authenticated do
    root :to => "dashboard#index", :as => "signed_in_root"
  end
  unauthenticated do
    root :to => "home#index"
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
