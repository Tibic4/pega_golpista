if Rails.env == 'production'
  url = ENV['BONSAI_URL']
  Elasticsearch::Model.client = Elasticsearch::Client.new({url: url, logs: true})
end

# ENV["ELASTICSEARCH_URL] = "https://ypev0wu2qs:7ttn39f9fj@ash-744992710.us-east-1.bonsaisearch.net:443"
