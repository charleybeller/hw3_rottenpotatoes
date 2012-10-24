Rottenpotatoes::Application.routes.draw do
  #Route that posts 'Search TMDb' form
  post '/movies/search_tmdb'

  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
