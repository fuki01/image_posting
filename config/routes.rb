Rails.application.routes.draw do
  devise_for :users
  root 'contexts#index'
  resources :users, only: [:index, :show]
  get 'contexts/category', to: 'contexts#category'
  resources :contexts,only: [:create,:new,:edit, :update, :show, :destroy] do
    resources :comments, only: [:create]
  end
end
