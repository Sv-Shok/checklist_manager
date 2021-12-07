Rails.application.routes.draw do
  resources :checklists
  root 'checklists#index'
end
