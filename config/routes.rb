Rails.application.routes.draw do
  root 'static_pages#top'

  resources :diagnoses, only: %i[index]
end
