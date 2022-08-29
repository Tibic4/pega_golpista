json.extract! task, :id, :date, :scam_type, :cep, :money_lost, :created_at, :updated_at
json.url task_url(task, format: :json)
