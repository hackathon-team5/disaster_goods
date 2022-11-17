Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#top'

  get '/privacy', to: 'static_pages#privacy'
  get '/teams', to: 'static_pages#teams'
  get '/search', to: 'diagnosis#search'
  get '/result', to: 'diagnosis#result'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :districts, only: [] do
    resources :towns, only: :index
  end
  resources :goods, only: :index
end
