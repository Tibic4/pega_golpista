require "json"
require "open-uri"

class Task < ApplicationRecord

  has_many :scammers
  accepts_nested_attributes_for :scammers, allow_destroy: true
  validates :cep, presence: true, length: { is: 8 }
  validate :valid_cep?
  # Scam types for select
  SCAM_TYPE = ["Whatsapp", "Site", "Email", "Instagram"]

  # Parse url = "https://viacep.com.br/ws/json/" see response is true
  def valid_cep?
    url = "https://viacep.com.br/ws/#{cep}/json/"
    raise
    ceps = URI.open(url).read
    cepis = JSON.parse(ceps)
    if not cepis["erro"].blank?
      errors.add(:cep, " inválido")
    end
  end

end
