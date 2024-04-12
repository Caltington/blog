Rails.application.routes.draw do
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index"
  get 'private', to: 'articles#private'
  get '/search', to: 'articles#search'
  get 'archive', to: 'articles#archive'
  resources :articles do
    resources :comments
  end
  get 'admin', to: 'admin#home'
end
