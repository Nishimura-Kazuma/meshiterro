Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  # get 'users/show'
  # get 'users/edit'
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get 'homes/about' => 'homes#about' , as:'about'
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end
  
end


# 例文
# resources :lists
  # get 'lists/new'
  # post 'lists' => 'lists#create'
  # get 'lists' => 'lists#index'
  # get 'lists/:id' => 'lists#show', as: 'list'
  # get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  # patch 'lists/:id' => 'lists#update', as: 'update_list'
  # delete 'lists/:id' => 'lists#destroy', as: 'destroy_list'