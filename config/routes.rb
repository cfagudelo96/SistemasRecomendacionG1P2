Rails.application.routes.draw do
  get '/load_data', to: 'home#load_data'
end
