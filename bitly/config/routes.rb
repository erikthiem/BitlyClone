Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  resources :urls
  root 'welcome#index'

  get 'go/:shortcode', to: 'urls#go'
end
