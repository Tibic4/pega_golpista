require "elasticsearch/model"

module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model

    settings analysis: {
      filter: {
        ngram_filter: {
          type: "ngram",
          min_gram: 2,
          max_gram: 3
        }
      },
      analyzer: {
        ngram_analyzer: {
          type: "custom",
          tokenizer: "standard",
          filter: [
            "lowercase",
            "asciifolding",
            "ngram_filter"
          ]
        },
        whitespace_analyzer: {
          type: "custom",
          tokenizer: "whitespace",
          filter: [
            "lowercase",
            "asciifolding"
          ]
        }
      }
    }
    mapping do
      indexes :autocomplete_hint, type: "text", analyzer: "ngram_analyzer"
    end

    after_commit do
      __elasticsearch__.index_document
    end
  end
end
