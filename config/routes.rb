Rails.application.routes.draw do
  namespace :api do
    namespace :animal do
      get 'index', to: 'animals#index'
      post 'create', to: 'animals#create'
      get '/show/:id', to: 'animals#show'
      delete '/destroy/:id', to: 'animals#destroy'
      put '/update/:id', to: 'animals#update'
    end

    namespace :tutor do
      get 'index', to: 'tutors#index'
      post 'create', to: 'tutors#create'
      get '/show/:id', to: 'tutors#show'
      delete '/destroy/:id', to: 'tutors#destroy'
      put '/update/:id', to: 'tutors#update'
    end
  end
  root 'home#index'
  get '/*path' => 'home#index' # redirect requests that doesn’t match the existing routes to home index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
