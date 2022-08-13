Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'jokes#show'

  get '/jokes/:position', to: 'jokes#show', as: 'joke'
end
