Ritly::Application.routes.draw do
  root "urls#index"
  resources :urls

  get '/:code', to: 'urls#redirectors'
  get '/:code/preview', to: 'urls#preview'
end
