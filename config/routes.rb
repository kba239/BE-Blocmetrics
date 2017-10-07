Rails.application.routes.draw do
  devise_for :users

  resources :registered_app

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

end
