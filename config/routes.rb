Rails.application.routes.draw do
  devise_for :users

  root 'board_games#index'

  resources :board_games
end
