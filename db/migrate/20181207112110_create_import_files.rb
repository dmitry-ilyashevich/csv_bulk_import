class CreateImportFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :import_files do |t|

      t.timestamps
    end
  end
end
