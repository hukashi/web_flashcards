class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :player_id, null: false
      t.integer :deck_id, null: false
      t.integer :percent_correct, default: 0

      t.timestamps null: false
    end
  end
end
