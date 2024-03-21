Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index"
  get 'private', to: 'articles#private'
  get 'archive', to: 'articles#archive'
  resources :articles do
    resources :comments
  end
  get 'admin', to: 'admin#home'
end
