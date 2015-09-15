Rails.application.routes.draw do
  
  resources :meetings
  
  root :to => 'application#index'
end
