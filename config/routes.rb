Rails.application.routes.draw do
  resources :skills

  post 'helpers/html_renderer', to: 'helpers#html_renderer'

  get 'settings', to: 'settings#show'
  get 'settings/edit', to: 'settings#edit'
  put 'settings/edit', to: 'settings#update'

  resources :programming_skills

  resources :publications

  resources :awards

  resources :educations, path: 'education'
  resources :users
  get '/educations', to: redirect('/education')
  root to: 'pages#curriculum'
  get 'pages/home'
  get 'pages/contact'
  get 'pages/curriculum'
  get 'contact', to: 'pages#contact'
  get 'settings', to: 'pages#settings'
  get 'contact_send', to: 'pages#contact_send'
  get 'curriculum', to: 'pages#curriculum'
  get 'about', to: 'pages#about'
  match 'subscribe', to: 'pages#subscribe', via: :post
  resources :softwares
  resources :referees
  resources :uploaded_files
  resources :internships
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  namespace :api do
    resources :awards, :educations, :internships, :skills, :referees, :programming_skills, :publications, :softwares
  end

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
