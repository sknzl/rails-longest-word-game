Rails.application.routes.draw do
  root 'games#new'
  get 'new', to: 'games#new', as: :new
  get 'reset', to: 'games#reset', as: :reset
  post 'score', to: 'games#score', as: :score
end
