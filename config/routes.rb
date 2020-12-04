Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/loginS'
  get 'cart/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "product#index"
  get 'product/index'
  get 'product/:id', to: "product#show", as: 'product' # product_path
  get 'category/index'
  get 'category/:id', to: "category#show", as: 'category' # category_path
  get 'fragrance_family/index'
  get 'fragrance_family/:id', to: "fragrance_family#show", as: 'fragrance_family' # fragrance_family_path
  get 'brand/index'
  get 'brand/:id', to: "brand#show", as: 'brand' # brand_path
  post 'product/add_to_cart/:id', to: 'product#add_to_cart', as: 'add_to_cart'
  patch 'cart/update_quantity/:quantity', to: 'product#update_quantity', as: 'update_quantity'
  delete 'cart/remove_from_cart/:id', to: 'cart#remove_from_cart', as: 'remove_from_cart'
  get 'customer/new', to: 'customer#new', as: 'new_customer'
  get 'customer/create', to: 'customer#create'
  resources :customers, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
