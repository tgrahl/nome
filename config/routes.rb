WickedExample::Application.routes.draw do

  devise_for  :users, :controllers => { :registrations => "registrations" }

  root        :to => "pages#index"

  resources   :after_register

  resources   :users
  post '/save_biographical_data' => 'pages#save_biographical_data', as: 'save_biographical_data'
  
  post '/save_education_data' => 'pages#save_education_data', as: 'save_education_data'
  
  post '/course_qualification_save' => 'pages#course_qualification_save', as: 'course_qualification_save'
  post '/education_save_data' => 'pages#education_save_data', as: 'education_save_data'
  
  get '/referral_data_save' => 'pages#referral_data_save', as: 'referral_data_save'
  get '/destroy_ref_data' => 'pages#destroy_ref_data', as: 'destroy_ref_data'
  get '/edit_referral_data' => 'pages#edit_referral_data', as: 'edit_referral_data'
  
  get '/supporting_document_save' => 'pages#supporting_document_save', as: 'supporting_document_save'


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
