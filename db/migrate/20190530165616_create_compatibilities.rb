class CreateCompatibilities < ActiveRecord::Migration[5.2]
  def change
    create_table :compatibilities do |t|
      t.references :stuffed_animal, foreign_key: { to_table: :products }, null: false
      t.references :accesory, foreign_key: { to_table: :products }, null: false

      t.timestamps
    end
  end
end
