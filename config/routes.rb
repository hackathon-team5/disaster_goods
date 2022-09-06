Rails.application.routes.draw do
  root 'static_pages#top'

  get '/search', to: 'diagnosis#search'
  get '/result', to: 'diagnosis#result'
  get '/rakuten', to: 'diagnosis#rakuten'
end
