Rails.application.routes.draw do
  resources :categories
  resources :blogs
  devise_for :users
  get 'blogs/categories/:category_id', to: 'blogs#show_category', as: :show_blogs_category
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
