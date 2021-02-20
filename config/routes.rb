Rails.application.routes.draw do
  root 'contexts#index'
  get 'likes/:id',            to: 'likes#show',      as: "like_show"
  devise_for :users
  resources :users,         only: [:index, :show] do
    resource :relationships,only: [:create, :destroy]
    get :follows,             on: :member
    get :followers,           on: :member
  end
  get 'contexts/category',    to: 'contexts#category'
  get 'contexts/follow',      to: 'contexts#follow'
  resources :contexts,      only: [:create, :new, :edit, :update, :show, :destroy] do
    resources :comments,    only: [:create]
    resources :likes,       only: [:create, :destroy]
  end
end
