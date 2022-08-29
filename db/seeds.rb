require 'faker'
require 'cep_brasil'

puts 'Exluindo dados antigos...'
Zone.destroy_all
Task.destroy_all

puts 'Criando novos dados...'

10.times do
  task = Task.new
  task.date = Faker::Date.between(from: 2.days.ago, to: Date.today)
  task.scam_type = ["whastapp", "sms", "email", "phone"].sample
  task.cep = CepBrasil::Random.generate_formatted
  task.money_lost = rand(1000..10000)
  task.save
end

zone = Zone.new
zone.ddd = 1
zone.region = "Novas Regiões"
zone.lat =  -23.5505
zone.long = -46.6333
zone.count = 0
zone.task_id = rand(1..10)
zone.save

puts 'Dados criados com sucesso!'
