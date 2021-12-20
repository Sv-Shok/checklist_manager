Rails.application.routes.draw do
  devise_for :users
  resources :checklists
  resources :audits do
    collection do
      get :choice_checklist
      post :choice_checklist
    end
  end  
  
  root 'checklists#index'
end
