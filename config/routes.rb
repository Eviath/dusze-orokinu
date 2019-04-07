
Rails.application.routes.draw do


  devise_scope :user do
    get "logowanie" => "devise/sessions#new", as: :new_user_session # custom path to login/sign_in
    post 'logowanie', to: 'devise/sessions#create', as: :user_session
    get "rejestracja" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
    delete 'wyloguj', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  devise_for :users, skip: [:sessions], controllers: { confirmations: 'confirmations', registrations: 'registrations' }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # error pages
  %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  localized do
    get 'messages/index'
    get 'comments/index'
    get 'comments/new'
    get 'conversations/index'

    get '/alliance',  to: 'alliance#index'
    root 'alliance#index'

    get 'alliance/about'
    get 'alliance/rules'
    get 'alliance/info'

    get '/cookies', to: 'cookies_eu#index'

    get '/clans',  to: 'clans#index'

    get 'warframe/poe'
    get 'warframe/newsfeed'
    get 'warframe/missions'
    get 'warframe/wfdrop'

    resources :contact
    resources :streamers

    resources :twitch

    resources :users do
      member do
        get :user_comments
        get :user_profile
      end
    end
    resources :news_categories
    resources :news do
      resources :comments
    end

    resources :comments do
      resources :likes
    end

    resources :requests, only: [:index, :podanie, :show, :new, :create, :destroy]
    resources :clans, only: [:index, :panel, :show, :new, :create, :edit, :update, :destroy]
    resources :clans do
        member do
            get :decline
            get :approve
        end
    end
    resources :requests do
        member do
            get :decline
            get :approve
            get :pend
        end
    end

    get  '/panel',  to: 'users#panel'
    get  '/pclan',  to: 'clans#panel'
    get  '/request', to:'requests#podanie'

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

    resources :messages, only: [:new, :create], :path_names => {:new => "nowa"}
  end
end
