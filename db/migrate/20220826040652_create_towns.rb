class CreateTowns < ActiveRecord::Migration[6.1]
  def change
    create_table :towns do |t|
      t.string :name, null: false
      t.integer :district_id, null: false

      t.timestamps
    end
  end
end
