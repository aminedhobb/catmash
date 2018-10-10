Rails.application.routes.draw do
  root to: 'mashes#index'
  patch '/mashes', to: 'mashes#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
