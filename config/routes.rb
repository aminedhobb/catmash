Rails.application.routes.draw do
  root to: 'cats#index'
  get '/scores', to: 'scores#index'
  patch '/scores', to: 'scores#update'
  resources :cats, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
