class ImportFile < ApplicationRecord
  has_one_attached :file

  def file_full_path
    ActiveStorage::Blob.service.send(:path_for, file.key)
  end
end
