Rails.application.routes.draw do
  root 'static_pages#top'

  get '/privacy', to: 'static_pages#privacy'
  get '/teams', to: 'static_pages#teams'
  get '/search', to: 'diagnosis#search'
  get '/result', to: 'diagnosis#result'

  resources :districts, only: [] do
    resources :towns, only: :index
  end
  resources :goods, only: :index
end
