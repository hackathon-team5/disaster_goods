class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :item_code, null: false
      t.string :amazon_link
      t.integer :type_id, null: false

      t.timestamps
    end
  end
end
