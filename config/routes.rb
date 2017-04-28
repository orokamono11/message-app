Rails.application.routes.draw do
  devise_for :users,sign_out_via: %i|get post delete|
  resources :welcome, :only => [:index]
  root "welcome#index"
  resources :users, :only => [:show, :index, :edit, :update]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index, :edit, :update]
end
