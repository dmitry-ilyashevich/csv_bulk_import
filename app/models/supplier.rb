class Supplier < ApplicationRecord
  has_many :products

  validates :code, :name, presence: true
end
