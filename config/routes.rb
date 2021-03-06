Rails.application.routes.draw do
  
  resources :reports
  resources :events
  get 'map/index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :users
  devise_for :admin_users
  mount RailsAdmin::Engine => '/admin_user', as: 'rails_admin'
  
  resources :pictures do
    resources :comments
  end

  resources :events do
    resources :comments
  end
  
  resources :pictures
  resources :locs
  resources :arts
  resources :pictures do
     resources :assets
   end

  root :to => 'events#root'
  
  get '/about', to: 'pages#about'
  get '/blog', to: 'arts#index'
  get '/picture', to: 'pictures#index'
  get '/me', to: 'pages#me'
  get '/event', to: 'events#index'
  get 'events/:id/picture/:name' => 'events#show_picture',
       as: 'events_picture'
  get 'events_by/:id' => 'events#index_by_user', as: 'events_by'
  get 'events_pasts'  => 'events#pasts', as: 'events_pasts'
  get 'events/:id/dup' => 'events#duplicate', as: 'dup_event'


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
  #     #     resources :sales do
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
