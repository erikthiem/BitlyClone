Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  resources :urls
  root 'urls#index'

  get 'go/:shortcode', to: 'urls#go'
end
