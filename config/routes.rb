Rails.application.routes.draw do

  get 'charges/new'

  get 'charges/create'

  resources :wikis

  put 'users/update'

  resources :charges, only: [:new, :create]

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
