
Rails.application.routes.draw do


  get 'messages/index'

  get 'conversations/index'

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
        resources :alliancerequests, only: [:index, :podanie, :show, :new, :create, :destroy]
        resources :clans, only: [:index, :panel, :show, :new, :create, :edit, :update, :destroy]
        resources :clans do
            member do
                get :decline
                get :approve
            end
        end
        resources :users do
            member do
                get :decline
                get :approve
            end
        end
        resources :alliancerequests do
            member do
                get :decline
                get :approve
                get :pend
            end
        end

  get  '/panel',  to: 'users#panel'
  get  '/klan',  to: 'clans#panel'
  get  '/podanie', to:'alliancerequests#podanie'
  get '/msg',  to: 'conversations#index'
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

end
