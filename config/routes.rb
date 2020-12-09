Rails.application.routes.draw do
  get 'order_detail/new'
  get 'order_detail/create'
  get 'order/new'
  get 'order/create'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/destroy'
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
  get 'destroy', to: 'sessions#destroy'
  post 'cart/qty/:id', to: 'cart#qty', as: 'qty_line_item_add'
  delete 'cart/qty/:id', to: 'cart#qty', as: 'qty_line_item_delete'
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
