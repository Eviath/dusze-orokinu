
Rails.application.routes.draw do


  get 'sessions/new'

  get '/sojusz',  to: 'sojusz#index'
  root 'sojusz#index'

  get 'sojusz/onas'
  get 'sojusz/regulamin'
  get 'sojusz/aktualnosci'
  get 'sojusz/informacje'

  get '/klany',  to: 'klany#index'

  get 'warframe/poe'
  get 'warframe/newsy'
  get 'warframe/misje'
  get 'warframe/wfdrop'

  get 'kontakt/discord'
  get 'kontakt/formularz'

    get  '/rejestracja',  to: 'users#new'
    post '/rejestracja',  to: 'users#create'
      get    '/login',   to: 'sessions#new'
      post   '/login',   to: 'sessions#create'
      delete '/logout',  to: 'sessions#destroy'
        resources :users
        resources :account_activations, only: [:edit]

  get  '/panel',  to: 'users#panel'
end
