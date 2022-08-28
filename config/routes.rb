Rails.application.routes.draw do
  root 'static_pages#top'
  get '/diagnose' => 'pages#diagnose'
  resources :districts do
    resources :towns
  end
end
