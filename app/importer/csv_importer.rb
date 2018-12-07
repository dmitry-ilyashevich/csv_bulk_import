require 'csv'

class CsvImporter
  CHUNK_SIZE = 10_000
  COL_SEP = '¦'

  attr_reader :filepath

  def initialize(filepath)
    @filepath = filepath
  end

  def run
    File.open(filepath, 'r') do |file|
      csv = CSV.new(file, col_sep: COL_SEP)

      index = 0
      rows = []

      while row = csv.shift
        if index < CHUNK_SIZE
          index += 1
          rows << row_hash(row)
        else
          import(rows)

          index = 0
          rows = []
        end
      end

      import(rows) if rows.present?
    end
  end
end
