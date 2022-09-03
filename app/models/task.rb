class Task < ApplicationRecord
  include Searchable
  has_many :scammers
  accepts_nested_attributes_for :scammers, allow_destroy: true
  validates :cep, correios_cep: true

  validates :date, :scam_type, :cep, :money_lost, presence: true

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :date
      indexes :scam_type
      indexes :cep
      indexes :money_lost
    end
  end
end
