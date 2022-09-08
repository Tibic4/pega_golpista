class Scammer < ApplicationRecord
  include ActiveModel::Validations
  validates_with MyValidator
  belongs_to :task
end
