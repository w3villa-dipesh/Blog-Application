Rails.application.routes.draw do
  resources :hobbies
  resources :blog_tags
  resources :tags
  resources :categories
  resources :likes, only: [:create, :destroy]
  resources :blogs do
    resources :comments, only: [:create]
  end
  devise_for :users
  get 'blogs/categories/:category_id', to: 'blogs#show_category', as: :show_blogs_category
  get 'blogs/tags/:tag_id', to: 'blogs#show_tag', as: :show_blogs_tag
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'home#index'
  root 'blogs#index'

  namespace :admin do
    resources :users
  end
end
