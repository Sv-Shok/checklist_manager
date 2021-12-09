Rails.application.routes.draw do
  devise_for :users
  resources :checklists do
    resources :questions
  end  
  root 'checklists#index'
end
