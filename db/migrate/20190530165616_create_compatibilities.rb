class CreateCompatibilities < ActiveRecord::Migration[5.2]
  def change
    create_table :compatibilities do |t|
      t.references :stuffed_animal, foreign_key: { to_table: :products }
      t.references :accesory, foreign_key: { to_table: :products }

      t.timestamps
    end
  end
end
