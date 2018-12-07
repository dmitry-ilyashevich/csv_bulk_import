class ImportSuppliersJob < ApplicationJob
  def perform(filepath)
    SuppliersImporter.new(filepath).run
  end
end
