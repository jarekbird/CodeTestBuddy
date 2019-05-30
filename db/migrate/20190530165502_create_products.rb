class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :description, null: false, index: true
      t.integer :size, index: true
      t.integer :quantity, null: false, default: 0
      t.float :cost, null: false
      t.float :sale_price, null: false
      t.string :type, index: true, null: false

      t.timestamps
    end
  end
end
