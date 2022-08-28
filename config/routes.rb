Rails.application.routes.draw do
  root 'static_pages#top'
  get '/diagnose' => 'pages#diagnose'
end
