Rails.application.routes.draw do
  devise_for :users
  resources :checklists, :audits
  
  root 'checklists#index'
end
