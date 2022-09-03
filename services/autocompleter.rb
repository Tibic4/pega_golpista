class Autocompleter
  MODELS_TO_SEARCH = [Task].freeze
  attr_accessor :query

  def initialize(query)
    @query = query
  end

  def self.call(query)
    new(query).call
  end

  def call
    results.map do |result|
      {
        hint: build_hint(result),
        record_type: result.class.name,
        record_id: result.id
      }
    end
  end

  private

  def results
    Elasticsearch::Model.search(search_query,
                                MODELS_TO_SEARCH).records
  end

  def build_hint(record)
    HintBuilder.call(record)
  end

  def search_query
    {
      size: 50,
      query: {
        function_score: {
          query: {
            bool: {
              must: [multi_match]
            }
          },
          functions: priorities
        }
      }
    }
  end

  def multi_match
    {
      multi_match: {
        query: @query,
        fields: %w[date scam_type cep money_lost],
        fuzziness: 'auto'
      }
    }
  end

  def priorities
    [
      {
        filter: {
          term: { _type: 'task' }
        },
        weight: 5000
      }
    ]
  end
end
