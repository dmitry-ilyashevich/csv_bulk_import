class Product < ApplicationRecord
  belongs_to :supplier, primary_key: :code

  validates :supplier_code, :name, :price_cents, presence: true
end
