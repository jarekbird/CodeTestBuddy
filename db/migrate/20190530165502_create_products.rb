class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :description
      t.integer :size
      t.integer :quantity
      t.float :cost
      t.float :sale_price

      t.timestamps
    end
  end
end
