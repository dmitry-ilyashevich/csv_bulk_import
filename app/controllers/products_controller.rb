class ProductsController < ApplicationController
  def new
    @import_file = ImportFile.new
  end

  def create
    @import_file = ImportFile.new(import_params)

    if @import_file.file.attached? && @import_file.save
      ImportProductsJob.perform_later(@import_file.file_full_path)
    end

    redirect_to root_path
  end

  private

  def import_params
    params.require(:import_file).permit(:file)
  end
end
