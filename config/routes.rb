NewDepot::Application.routes.draw do

  resources :commands do
    member do
      get 'new'
      post 'create'
    end
  end

  get "fireworks/back_up"
  get 'fireworks/autocomplete_firework_name'
  get 'data_forms/autocomplete_firework_name'

  resources :fireworks
  resources :data_forms
  resources :data_lists
  resources :logins
  resources :loadback
  resources :categories do
    member do
      post :resort
    end
  end

  get 'logout' => 'logins#destroy', :as => :logout

  get 'finished/:id' => 'fireworks#finished', :as => :finished
  get 'search', :controller=>:fireworks, :action =>'search'

  root 'fireworks#index'

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
