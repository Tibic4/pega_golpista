class Scammer < ApplicationRecord
  include Elasticsearch::Model
  include Searchable
  belongs_to :task
end
