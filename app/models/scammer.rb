class Scammer < ApplicationRecord
  # searchkick
  belongs_to :task
  FRAUDS= ["INSTAGRAM", "WHATSAPP", "SITES FRAUDULENTOS"]
end
