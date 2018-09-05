
Rails.application.routes.draw do


  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get '/sojusz',  to: 'sojusz#index'
  root 'sojusz#index'

  get 'sojusz/onas'
  get 'sojusz/regulamin'
  get 'sojusz/aktualnosci'
  get 'sojusz/informacje'

  get '/clans',  to: 'clans#index'

  get 'warframe/poe'
  get 'warframe/newsy'
  get 'warframe/misje'
  get 'warframe/wfdrop'

  get 'kontakt/discord'
  get 'kontakt/formularz'

    get  '/rejestracja',  to: 'users#new'

      get    '/login',   to: 'sessions#new'
      post   '/login',   to: 'sessions#create'
      delete '/logout',  to: 'sessions#destroy'
        resources :users
        resources :account_activations, only: [:edit]
        resources :password_resets,     only: [:new, :create, :edit, :update]
        resources :alliancerequests
        resources :clans, only: [:show, :new]

  get  '/panel',  to: 'users#panel'
  get  '/clans/dashboard',  to: 'clans#dashboard'


end
