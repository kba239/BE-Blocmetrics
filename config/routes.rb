Rails.application.routes.draw do
  devise_for :users

  resources :registeredapp

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

end
