class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :sku, null: false
      t.string :supplier_code, null: false
      t.string :name, null: false

      t.string :additional_column_1
      t.string :additional_column_2
      t.string :additional_column_3
      t.string :additional_column_4
      t.string :additional_column_5

      t.integer :price_cents, null: false, default: 0

      t.timestamps

      t.index :sku, unique: true
      t.index :supplier_code
    end

    add_presence_constraint :products, :sku
    add_unique_constraint :products, :sku, deferrable: false
    add_presence_constraint :products, :supplier_code
    add_presence_constraint :products, :name
  end
end
