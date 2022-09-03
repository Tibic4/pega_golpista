require "elasticsearch/model"
module Searchable
  extend ActiveSupport::Concern
  included do
    include Elasticsearch::Model
    after_commit :index_document, if: :persisted?
    after_commit on: [:destroy] do
      __elasticsearch__.delete_document
    end
  end

  private

  def index_document
    __elasticsearch__.index_document
  end
end
