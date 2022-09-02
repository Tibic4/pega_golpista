require 'csv'
class Task < ApplicationRecord
  include Searchable
  has_many :scammers
  accepts_nested_attributes_for :scammers, allow_destroy: true
  validates :cep, correios_cep: true

  def self.import_csv!
    filepath = "/path/to/your/file/tcc_ceds_music.csv"
    res = CSV.parse(File.read(filepath), headers: true)
    res.each_with_index do |s, _ind|
      Song.create!(
        artist: s["artist_name"],
        title: s["track_name"],
        genre: s["genre"],
        lyrics: s["lyrics"]
      )
    end
  end
end
