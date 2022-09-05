class Task < ApplicationRecord
  # Searchkick callbacks and mappings

  has_many :scammers
  accepts_nested_attributes_for :scammers, allow_destroy: true
  # validates :cep, correios_cep: true
  searchkick
end
