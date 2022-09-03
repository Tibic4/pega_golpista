class Scammer < ApplicationRecord
  include Searchable
  belongs_to :task
end
