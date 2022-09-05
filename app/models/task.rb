class Task < ApplicationRecord
  searchkick
  has_many :scammers
  accepts_nested_attributes_for :scammers, allow_destroy: true
  validates :cep, correios_cep: true

  # Advance search
  def self.advanced_search(search_results)
    if search_results
      Task.search(search_results, fields: %i[cep scam_type date], match: :word_start, misspellings: { below: 5 })
    else
      all
    end
  end
end
