Rails.application.routes.draw do
  resources :billing_addresses
  resources :carousel_images
  resources :customers
  resources :fundraising_requests
  devise_for :users

  resources :charges

  resources :dashboard do
    collection do
      get "admin"
    end
  end

  resources :line_items do
    member do
      delete "remove_from_cart"
    end
  end

  resources :products do
    collection do
      get "public"
    end
    member do
      get "public_show"
    end
  end

  resources :rental_locations

  resources :sales do
    member do
      get "send_receipt"
    end
  end

  get "fundraising", to: "fundraising_requests#new"
  get "fundraising_request", to: "fundraising_requests#submitted", as: "fundraising_request_submitted"

  get "terms_and_conditions" => "dashboard#terms_and_conditions", as: "terms_and_conditions"
  get "privacy_policy" => "dashboard#privacy_policy", as: "privacy_policy"

  get "cart" => "checkout#cart", as: "cart"
  get "review_and_pay" => "checkout#review_and_pay", as: "review_and_pay"
  get "thank_you" => "checkout#thank_you", as: "thank_you"

  root "dashboard#index"
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
