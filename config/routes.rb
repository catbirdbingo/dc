Rails.application.routes.draw do

  resources :tasks
  resources   :polls
  match       '/polls/:id/voting' => 'polls#voting', via: [:get], :as => :voting_poll
  match       '/mypolls' => 'polls#my_index', via: [:get], :as => :my_polls
  post        '/votes' => 'votes#create', via: [:post], :as => :new_votes

  resources   :posts
  match       '/myposts' => 'posts#my_index', via: [:get], :as => :my_posts
  
  resources		:profiles, only: [:show, :edit, :update ]
  resources 	:flats
  resources   :chat_messages

  devise_for 	:users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  resources   :users do
    resources :emails, only: [:index, :show, :new, :create, :destroy]
  end

  match 		  '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  root 			  'welcome#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  mount ActionCable.server => '/cable'

  mount Commontator::Engine => '/commontator'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
