
Rails.application.routes.draw do


  resources :news
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'messages/index'

  get 'conversations/index'


  get '/alliance',  to: 'alliance#index'
  root 'alliance#index'

  get 'alliance/about'
  get 'alliance/rules'
  get 'alliance/info'



  get '/clans',  to: 'clans#index'

  get 'warframe/poe'
  get 'warframe/newsfeed'
  get 'warframe/missions'
  get 'warframe/wfdrop'

  get 'contact/index'



    resources :users

        resources :requests, only: [:index, :podanie, :show, :new, :create, :destroy]
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

  resources :messages, only: [:new, :create]

end
