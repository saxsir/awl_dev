# -*- coding: utf-8 -*-
AwlDev::Application.routes.draw do

  root :to => "home#index"

  get '/about' => "home#about"

  devise_for :users

  devise_for :admin_users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :supports do
    collection do
      get 'success',:as => "success"
      get 'cancel', :as => "cancel"
      get 'failed'
    end
  end

  resources :rewards

  # thanksを上に書かないと、show/:id とコンフリクトする
  get 'projects/thanks' => 'projects#thanks'
  get 'projects/:id/procedure' => 'projects#procedure'
  get 'projects/:project_id/reward/new' => 'projects#reward'
  post 'projects/:project_id/reward/new' => 'projects#save_reward_ajax', :as => 'save_new_reward'
  delete 'projects/:project_id/reward/destroy/:reward_id' => 'projects#destroy_reward_ajax', :as => 'destory_reward'
  get 'projects/:id/confirm' => 'projects#confirm_project'
  resources :projects

  resources :users, :only => [:edit, :update]
  get '/mypage/:username' => 'mypage#index', :as => 'mypage_index'
  get '/mypage/:username/edit' => 'mypage#edit'
  get '/mypage/:username/error' => 'mypage#error'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
