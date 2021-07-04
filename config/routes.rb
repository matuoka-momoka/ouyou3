Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users, only: [:show, :create, :index, :destroy, :edit, :update]


end
