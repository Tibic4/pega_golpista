class Task < ApplicationRecord
  # Searchkick callbacks and mappings

  has_many :scammers
  accepts_nested_attributes_for :scammers, allow_destroy: true
  validates :cep, presence: true, length: { is: 8 }, numericality: { only_integer: true }, if: :valid_cep?

  # Scam types for select

  SCAM_TYPE = ["Whatsapp", "Site", "Email", "Instagram"]
  # Parse url = "https://viacep.com.br/ws/json/" see response is true
  def valid_cep?
    url = "https://viacep.com.br/ws/#{cep}/json/"
    response = HTTParty.get(url)
    response["erro"].blank?
  end

end
