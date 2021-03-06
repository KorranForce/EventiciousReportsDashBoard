Rails.application.routes.draw do
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
  root 'dashboard#index'
  resources :dashboard do 
    collection do
      get :get_report_table_body
    end
  end
  resources :jenkins do
    collection do
      get :builds
      get :current_builds
    end
  end
  resources :testrunner do
    collection do
      get :custom
      get :tests
      get :get_scenario_of_feature
      get :add_feature
      get :retry_failed
      get :retry_run_params
      get :retry_all
    end
  end
  namespace :api do
    resources :scenarioparser do
      collection do
        post :parse
        get :get_tests
        post :get_test
        post :add_feature
        get :get_features
        delete :delete_feature
        delete :delete_scenario
      end
    end
    resources :testrun do
      collection do
        post :run
        post :createJob
      end
    end
    resources :runparser do
      collection do
        post :parse
      end
    end
  end
end
