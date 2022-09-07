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
    if cep.empty?
      errors.add(:cep, "campo obrigatório")
    else
      url = "https://viacep.com.br/ws/#{cep}/json/"
      ceps = URI.open(url).read
      cepis = JSON.parse(ceps)
      errors.add(:cep, " inválido") unless cepis["erro"].blank?
    end
  end
end
