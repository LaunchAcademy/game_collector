Rails.application.routes.draw do
  devise_for :users
  root to: "board_games#index"
  resources :board_games, only: [:new, :create, :index]
end
