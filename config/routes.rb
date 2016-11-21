Rails.application.routes.draw do
  root to: 'static_pages#home'
  get  'signup', to: 'users#new'
  get  'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  delete  'logout', to: 'sessions#destroy'
  
  resources :users do
    member do
      get 'followings'
      get 'followers'
    end
  end
  resources :microposts
  post 'microposts/:id', to: 'microposts#retweet'
  
  resources :relationships, only: [:create, :destroy]



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
