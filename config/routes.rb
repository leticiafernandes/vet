Rails.application.routes.draw do
  namespace :api do
    namespace :animal do
      get 'animals/index'
      post 'animals/create'
      get '/show/:id', to: 'animals#show'
      get '/destroy/:id', to: 'animals#destroy'
    end
  end
  root 'home#index'
  get '/*path' => 'home#index' # redirect requests that doesn’t match the existing routes to home index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
