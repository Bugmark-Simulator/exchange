Rails.application.routes.draw do
  devise_for :users
  get 'static/home'

  get 'static/help'

  resources :contracts do
    get 'resolve', :on => :member
  end
  resource  :contract_forecasts , path: "/contracts"
  resources :contract_pubs      , path: "/contracts"
  resources :contract_takes     , path: "/contracts"

  resources :users

  resources :bugs

  resources :repos do
    get 'sync', :on => :member
  end
  resources :repo_git_hubs      , path: "/repos"

  root "static#home"

end
