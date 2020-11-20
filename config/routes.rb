Rails.application.routes.draw do
  get 'product/index'
  get 'product/show'
  get 'category/index'
  get 'category/show'
  get 'fragrance_family/index'
  get 'fragrance_family/show'
  get 'brand/index'
  get 'brand/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
