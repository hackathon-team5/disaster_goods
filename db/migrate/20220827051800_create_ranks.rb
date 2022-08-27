class CreateRanks < ActiveRecord::Migration[6.1]
  def change
    create_table :ranks do |t|
      t.integer :total_danger_rank, null: false
      t.integer :fire_danger_rank, null: false
      t.integer :building_collapse_rank, null: false
      t.integer :active_difficulty_rank, null: false
      t.integer :town_id, null: false

      t.timestamps
    end
  end
end
