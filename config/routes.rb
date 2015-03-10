Rails.application.routes.draw do
  root to: "troops#index"
  
  get 'calendar/show'

  devise_for :members
  resources :members, only: [:show, :destroy] do 
    member do 
      put :approve, :reject
    end
  end

  post '/leader-invitation', to: 'members#send_leader_invitation'  
  resources :troops

  namespace :admin do 
    get 'panel', to: "main#panel"
  end

  get 'pages/about'
  get "pages/blog"
  get "pages/contact" #, :as => 'contact_page'
  get "pages/calendar"
  get "pages/badgetracker"
  get "pages/budget"
  get "pages/gallery"
  get "pages/jobs"
  get "pages/meeting"
  get "pages/newsletter"
  get "pages/scoutlist"
 
  # match '/gallery' => 'pages#gallery'
  # match '/about' => 'pages#about'
  # match '/contact' => 'pages#contact'

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
