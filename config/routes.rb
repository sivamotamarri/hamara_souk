HamaraSouk::Application.routes.draw do
  
#  if (app = Rails.application).config.assets.compile
#     puts app.assets
#    mount app.assets => app.config.assets.prefix
# end
  resources :ads do
    member do
      get :selection_cat , :sub_categories
    end 
    collection do
      get :search
    end
  end
  devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  ActiveAdmin.routes(self)

  
  devise_for :admin_users, ActiveAdmin::Devise.config

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
    # user watchings
    match 'users/watchings' => 'user_actions#watchings'
    match 'users/create_watching/:id' => 'user_actions#create_watching'
    match 'users/unwatch' => 'user_actions#unwatch' , :via => :post

    # user ads
    match 'users/ads' => 'user_actions#ads'
  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
   match "about" => "home#about" , :as => :about
   match "termsandcond" => "home#termsandcond" , :as => :termsandcond
   match "contact-us" => "home#contact_us" , :as => :contact_us
   
   match ':section/:category/:sub_categories' => 'ads#index' , :as => :sub_cat_ad  
   match ':section/:category' => 'sections#details' , :as => :category_ad    
   match ':section/' => 'sections#index' , :as => :section_ad   
   match 'sections/:section/ad/:ad' => 'ads#show' , :as => :ad_details
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
  # root :to => "welcome#index"
   root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
