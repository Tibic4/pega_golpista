module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mapping do
      indexes :date, type: 'date'
      indexes :scam_type, type: 'text'
      indexes :cep, type: 'integer'
      indexes :money_lost, type: 'float'
      # mapping definition goes here
    end

    def self.search(query, scam_type = nil)
      __elasticsearch__.search(
        {
          query: {
            bool: {
              must: {
                multi_match: {
                  query: query,
                  fields: %w[date cep money_lost]
                }
              },
              filter: {
                term: { scam_type: scam_type }
              }
            }
          }
        }
      )
    end
  end
end
