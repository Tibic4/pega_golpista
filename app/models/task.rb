class Task < ApplicationRecord
  has_many :zones
  has_many :scammers
end
