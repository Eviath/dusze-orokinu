
Rails.application.routes.draw do


  get 'messages/index'

  get 'conversations/index'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get '/alliance',  to: 'alliance#index'
  root 'alliance#index'

  get 'alliance/about'
  get 'alliance/rules'
  get 'alliance/news'
  get 'alliance/info'

  get '/clans',  to: 'clans#index'

  get 'warframe/poe'
  get 'warframe/newsfeed'
  get 'warframe/missions'
  get 'warframe/wfdrop'

  get 'contact/discord'
  get 'contact/contact-form'

    get  '/register',  to: 'users#new'

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
  get  '/pclan',  to: 'clans#panel'
  get  '/request', to:'alliancerequests#podanie'

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
        delete :empty_trash
      end
  end

  resources :messages, only: [:new, :create]

end
