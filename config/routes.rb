Rails.application.routes.draw do

  # get 'idea/index'

  # get 'idea/show'

  # get 'idea/new'

  # get 'idea/create'

  # get 'idea/edit'

  # get 'idea/update'

  # get 'events/show'

  resources :ideas
  
  root to: "troops#index"


  
  devise_for :members
  resources :members, only: [:show, :destroy] do 
    member do 
      put :approve, :reject
    end
  end

  post '/leader-invitation', to: 'members#send_leader_invitation'  
  resources :troops do 
    resource :calendar, only: [:show]
    resources :events
  end

  namespace :admin do 
    get 'panel', to: "main#panel"
  end

  match 'search/', to: 'search#results', via: [:get, :post]
  resources :search, only: [:index] do
    get :autocomplete, :on => :collection
  end
  get 'search/:term', to: 'search#results'

  get 'pages/about'
  get "pages/blog"
  get "pages/contact" #, :as => 'contact_page'
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
end
