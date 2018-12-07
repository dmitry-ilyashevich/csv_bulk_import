class ImportProductsJob < ApplicationJob
  def perform(filepath)
    ProductsImporter.new(filepath).run
  end
end
