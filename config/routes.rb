Rails.application.routes.draw do
  get 'events/show'

  root to: "search#index"

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
