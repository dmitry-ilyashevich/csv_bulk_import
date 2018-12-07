class ProductsImporter < CsvImporter
  private

  def row_hash(row_array)
    {
      sku: row_array[0],
      supplier_code: row_array[1],
      name: row_array[2],
      additional_column_1: row_array[3],
      additional_column_2: row_array[4],
      additional_column_3: row_array[5],
      additional_column_4: row_array[6],
      additional_column_5: row_array[7],
      price_cents: (row_array[8].to_f * 100).to_i
    }
  end

  def import(products)
    Product.import products,
      on_duplicate_key_update: {
        conflict_target: [:sku],
        columns: [
          :name,
          :price_cents,
          :additional_column_1,
          :additional_column_2,
          :additional_column_3,
          :additional_column_4,
          :additional_column_5
        ]
      }
  end
end
