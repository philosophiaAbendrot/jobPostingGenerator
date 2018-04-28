Rails.application.routes.draw do
  resources :postings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'postings#index'
end
