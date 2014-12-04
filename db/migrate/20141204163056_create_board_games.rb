class CreateBoardGames < ActiveRecord::Migration
  def change
    create_table :board_games do |t|
      t.string :name, null: false
      t.string :publisher
      t.text :description
      t.date :release_date

      t.timestamps
    end

    add_index :board_games, :name, unique: true
  end
end
