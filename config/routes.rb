Rails.application.routes.draw do
  root 'home#index'
  
  resources :invoices
  resources :home, only: :index
  
  devise_for :users
  # redirect to error page if route not found
  get '*path', to: 'errors#error_404', via: :all
end
