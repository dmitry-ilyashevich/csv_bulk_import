class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers, id: false do |t|
      t.string :code, null: false
      t.string :name, null: false

      t.timestamps

      t.index :code, unique: true
    end

    add_presence_constraint :suppliers, :name
    add_presence_constraint :suppliers, :code
    add_unique_constraint :suppliers, :code, deferrable: false
  end
end
