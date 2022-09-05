class Autocompleter < Struct.new(:query)
  MODELS_TO_SEARCH = [Task, Scammer]

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

  def search_query
    {
      size: 50,
      query: {
        function_score: {
          query: {
            match: {
              _all: {
                query:,
                operator: "and"
              }
            }
          },
          functions: [
            {
              filter: { term: { _type: "scam type" } },
              weight: 5_000
            }
          ]
        }
      }
    }
  end

  def results
    Elasticsearch::Model.search(search_query, MODELS_TO_SEARCH).records
  end

  def build_hint(record)
    BuildHint.call(record)
  end
end
