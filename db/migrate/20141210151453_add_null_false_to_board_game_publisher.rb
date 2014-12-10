class AddNullFalseToBoardGamePublisher < ActiveRecord::Migration
  def change
    change_column_null :board_games, :publisher, false
  end
end
