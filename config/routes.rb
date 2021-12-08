Rails.application.routes.draw do
  devise_for :users
  resources :checklists
  root 'checklists#index'
end
