Rails.application.routes.draw do
  root to: 'home#index'
  get '/recommendations', to: 'recommendations#index'
  get '/recommendations/load_recommendations', to: 'recommendations#load_recommendations'
  post '/recommendations/login', to: 'recommendations#login'
  get '/recommendations/logout', to: 'recommendations#logout'
end
