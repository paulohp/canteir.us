Canteiro::Application.routes.draw do

  resources :plans


  get "static/entrar"

  resources :categories
  
  devise_for :admin_users, ActiveAdmin::Devise.config

  get "home" => "home#index"

  devise_for :companies
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  

  resources :companies
  resources :resumes
  resources :applies
  resources :users do
    resources :resumes
  end

  resources :jobs do
    resources :resumes do
      resources :applies
    end
  end

  match 'plans/:id/comprar' => "plans#comprar"
  match 'comprar' => 'plans#confirmation'
  post 'plans/notification'

  match 'empresas/:id' => 'companies#show'
  match 'empresas' => 'companies#index'

  match 'entrar' => 'static#entrar'
  match 'jobs/:job_id/applies/new' => "applies#new"
  match 'users/:user_id/resumes/:id' => "resumes#show"

  get "/jobs/:job_id/resumes/:resume_id/applies/:id" => "applies#show"

  match 'jobs/:job_id/applies/' => "applies#index"
  match 'companies/:company_id/jobs' => "companies#my_jobs"

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  ActiveAdmin.routes(self)
end
