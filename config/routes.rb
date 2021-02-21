Rails.application.routes.draw do

  get '/series', to: 'series#index', as: :series
  get 'series/new', to: 'series#new', as: :new_serie
  post 'series', to: 'series#create'
  get 'series/:id', to: 'series#show', as: :serie
  delete 'series/:id', to: 'series#destroy'
  post 'series/:series_id/reviews', to: 'reviews#create', as: :serie_reviews
  get 'series/:series_id/reviews/new', to: 'reviews#new', as: :new_series_review
  delete  '/reviews/:id', to: 'reviews#destroy', as: :review
  root to: 'series#index'
  # resources :series, path: :series
  # resources :series, except: :show do
  #   resources :reviews, only: [:new, :create]
  # end
  # resources :reviews, only: [:destroy]
  # get 'series/:id', to: 'series#show', as: :serie


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
