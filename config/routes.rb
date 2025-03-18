Rails.application.routes.draw do
  post('signup', to: 'users#create')

  post('login', to: 'authentication#login')

  get('movies', to: 'movies#index')
  post('add_movie', to: 'movies#create')
end
