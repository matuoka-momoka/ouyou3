Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  root to: 'homes#top'
 resources :users, only: [:show,:new, :create, :index, :destroy, :edit]

end
