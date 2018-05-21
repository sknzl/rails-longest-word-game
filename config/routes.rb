Rails.application.routes.draw do
  root 'games#new'
  get 'new', to: 'games#new', as: :new
  post 'score', to: 'games#score', as: :score
end
