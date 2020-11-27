Rails.application.routes.draw do
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
  delete 'cart/remove_from_cart/:id', to: 'cart#remove_from_cart', as: 'remove_from_cart'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
