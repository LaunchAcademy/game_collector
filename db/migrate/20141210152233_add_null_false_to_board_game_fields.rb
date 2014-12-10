class AddNullFalseToBoardGameFields < ActiveRecord::Migration
  def change
    change_column_null :board_games, :description, false
    change_column_null :board_games, :release_date, false
  end
end
