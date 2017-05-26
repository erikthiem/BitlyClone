Rails.application.routes.draw do
  resources :urls
  root 'urls#index'

  get 'go/:shortcode', to: 'urls#go'
end
