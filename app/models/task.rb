class Task < ApplicationRecord
  # Searchkick callbacks and mappings

  has_many :scammers
  accepts_nested_attributes_for :scammers, allow_destroy: true
  # validates :cep, correios_cep: true
  searchkick callbacks: :async, word_start: %i[name cep scam_type],
             merge_mappings: true,
             settings: {
               analysis: {
                 analayzer: {
                   custom_char: {
                     type: "custom",
                     tokenizer: "whitespace",
                     filter: ["lowercase", "asciifolding"]
                   }
                 },
                 filter: {
                   custom_filter: {
                     type: "word_delimiter",
                     type_table: ['# => ALPHA', '( => ALPHA', ') => ALPHA', ': => ALPHA']
                   }
                 }
               }
             },
             mappings: {
               tasks: {
                 properties: {
                   cep: { type: "integer", index: 'analyzed', analyzer: "custom_char" },
                   scam_type: { type: "string", index: 'analyzed', analyzer: "custom_char" },
                   date: { type: "date" }
                 }
               }
             }
end
