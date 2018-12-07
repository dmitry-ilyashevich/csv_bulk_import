class SuppliersImporter < CsvImporter
  private

  def row_hash(row_array)
    {
      code: row_array[0],
      name: row_array[1]
    }
  end

  def import(suppliers)
    Supplier.import suppliers,
      on_duplicate_key_update: {
        conflict_target: [:code],
        columns: [:name]
      }
  end
end
