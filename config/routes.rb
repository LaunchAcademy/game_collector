Rails.application.routes.draw do
  resources :board_games, only: [:new, :create, :index]
end
