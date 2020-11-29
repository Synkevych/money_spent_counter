Rails.application.routes.draw do
  root 'invoices#index'
  
  resources :invoices
  
  devise_for :users
  # redirect to error page if route not found
  get '*path', to: 'errors#error_404', via: :all
end
