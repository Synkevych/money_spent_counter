Rails.application.routes.draw do
  root 'invoices#index'
  
  resources :invoices
  
  devise_for :users
end
