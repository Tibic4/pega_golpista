if Rails.env == 'production'
  url = ENV["ELASTICSEARCH_URL"]
  transport_options = {  request: { timeout: 250 } }
  options = { hosts: url, retry_on_failure: true, transport_options: transport_options }
  Searchkick.client = Elasticsearch::Client.new(options)
end

# ENV["ELASTICSEARCH_URL] = "https://ypev0wu2qs:7ttn39f9fj@ash-744992710.us-east-1.bonsaisearch.net:443"
