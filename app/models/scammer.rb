class Scammer < ApplicationRecord
  # include ActiveModel::Validations
  # validates_with MyValidator, fields: [:description], on: :create
  belongs_to :task
end
