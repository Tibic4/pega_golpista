class Task < ApplicationRecord
  include Elasticsearch::Model
  include Searchable
  has_many :scammers
  accepts_nested_attributes_for :scammers, allow_destroy: true
  validates :cep, correios_cep: true

end
