require 'faker'
require 'cep_brasil'
require 'correios-cep'

puts 'Exluindo dados antigos...'
Zone.destroy_all
Scammer.destroy_all
Task.destroy_all

puts 'Criando novos dados...'

# validates @cep, correios_cep: true

100.times do
  ceps = CepBrasil::Random.generate_formatted.to_s.gsub('-', '')
  puts ceps
  task = Task.new
  task.date = Faker::Date.between(from: 2.days.ago, to: Date.today)
  task.scam_type = ["whastapp", "sms", "email", "phone"].sample
  task.cep = ceps.to_i
  task.money_lost = rand(1000..10_000)
  task.save!
  telefone = Faker::PhoneNumber.cell_phone
  scammer = Scammer.new
  scammer.name = Faker::Name.name
  scammer.email = Faker::Internet.email
  scammer.phone = telefone.to_s
  scammer.website = Faker::Internet.url
  scammer.description = Faker::Lorem.paragraph
  scammer.task = task
  scammer.save!
end

puts 'Dados criados com sucesso!'
zone = Zone.new
zone.ddd = 1
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 2
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 3
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 4
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 5
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 6
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 7
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 8
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 9
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 10
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 11
zone.region = "São Paulo"
zone.longitude = -46.63952
zone.latitude =  -23.532905
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 12
zone.region = "São José dos Campos"
zone.longitude = -45.884115
zone.latitude = -23.189554
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 13
zone.region = "Santos"
zone.longitude = -46.335042
zone.latitude =  -23.953543
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 14
zone.region = "Bauru"
zone.longitude = -49.087142
zone.latitude = -22.324569
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 15
zone.region = "Sorocaba"
zone.longitude = -47.445073
zone.latitude =  -23.496886
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 16
zone.region = "Ribeirão Preto"
zone.longitude = -47.809875
zone.latitude = -21.169923
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 17
zone.region = "São José do Rio Preto"
zone.longitude = -49.375767
zone.latitude =  -20.811289
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 18
zone.region = "Presidente Prudente"
zone.longitude = -51.392526
zone.latitude = -22.120654
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 19
zone.region = "Campinas"
zone.longitude = -47.06595
zone.latitude =  -22.905346
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 20
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 21
zone.region = "Rio de Janeiro"
zone.longitude = -43.200295
zone.latitude =  -22.912897
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 22
zone.region = "Campos dos Goytacazes"
zone.longitude = -41.318055
zone.latitude = -21.762171
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 23
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 24
zone.region = "Petrópolis"
zone.longitude = -43.192613
zone.latitude = -22.519963
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 25
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 26
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 27
zone.region = "Vitória"
zone.longitude = -40.312806
zone.latitude = -20.315472
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 28
zone.region = "Cachoeiro de Itapemirim"
zone.longitude = -41.119829
zone.latitude =  -20.846212
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 29
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 30
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 31
zone.region = "Belo Horizonte"
zone.longitude = -43.926572
zone.latitude = -19.910183
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 32
zone.region = "Juiz de Fora"
zone.longitude = -43.339759
zone.latitude =  -21.75952
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 33
zone.region = "Gorvernador Valadares"
zone.longitude = -41.95553
zone.latitude = -18.854452
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 34
zone.region = "Uberlândia"
zone.longitude = -48.274934
zone.latitude = -18.914142
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 35
zone.region = "Poços de Caldas"
zone.longitude = -46.569184
zone.latitude = -21.779975
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 36
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 37
zone.region = "Divinópolis"
zone.longitude = -44.891223
zone.latitude =  -20.144646
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 38
zone.region = "Montes Claros"
zone.longitude = -43.857809
zone.latitude = -16.728177
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 39
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 40
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 41
zone.region = "Coritiba"
zone.longitude = -49.276855
zone.latitude = -25.441105
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 42
zone.region = "Ponta Grossa"
zone.longitude = -50.166787
zone.latitude = -25.091622
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 43
zone.region = "Londrina"
zone.longitude = -51.1691
zone.latitude = -23.303975
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 44
zone.region = "Maringá"
zone.longitude = -51.933298
zone.latitude = -23.420545
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 45
zone.region = "Cascavel"
zone.longitude = -53.459005
zone.latitude = -24.957301
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 46
zone.region = "Francisco Beltrão"
zone.longitude = -53.053466
zone.latitude = -26.081677
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 47
zone.region = "Joinville"
zone.longitude = -48.843380
zone.latitude = -26.304516
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 48
zone.region = "Florianópolis"
zone.longitude = -48.547696
zone.latitude = -27.594486
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 49
zone.region = "Chapecó"
zone.longitude = -52.61519
zone.latitude = -27.100448
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 50
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 51
zone.region = "Porto Alegre"
zone.longitude = -51.206533
zone.latitude = -30.031771
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 52
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 53
zone.region = "Pelotas"
zone.longitude = -52.337058
zone.latitude = -31.764898
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 54
zone.region = "Caxias do Sul"
zone.longitude = -51.179161
zone.latitude = -29.162905
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 55
zone.region = "Santa Maria"
zone.longitude = -53.814946
zone.latitude = -29.686817
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 56
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 57
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 58
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 59
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 60
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 61
zone.region = "Distrito Federal"
zone.longitude = -47.9292
zone.latitude =  -15.7801
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 62
zone.region = "Goiania"
zone.longitude = -49.264346
zone.latitude = -16.686439
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 63
zone.region = "Palmas"
zone.longitude = -48.355751
zone.latitude = -10.239973
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 64
zone.region = "Rio Verde"
zone.longitude = -50.919195
zone.latitude = -17.792266
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 65
zone.region = "Cuiabá"
zone.longitude = -56.097397
zone.latitude = -15.600979
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 66
zone.region = "Rondonopolis"
zone.longitude = -54.637173
zone.latitude = -16.467251
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 67
zone.region = "Campo Grande"
zone.longitude = -54.629463
zone.latitude = -20.448589
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 68
zone.region = "Rio Branco"
zone.longitude = -67.824348
zone.latitude = -9.97499
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 69
zone.region = "Porto Velho"
zone.longitude = -63.899902
zone.latitude = -8.760772
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 70
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 71
zone.region = "Salvador"
zone.longitude = -38.501068
zone.latitude = -12.97178
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 72
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 73
zone.region = "Itabuna"
zone.longitude = -39.278056
zone.latitude = -14.787573
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 74
zone.region = "Juazeiro"
zone.longitude = -40.503251
zone.latitude = -9.416217
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 75
zone.region = "Feira de Santana"
zone.longitude = -38.966293
zone.latitude = -12.266429
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 76
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 77
zone.region = "Vitória da Conquista"
zone.longitude = -40.844159
zone.latitude = -14.861466
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 78
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 79
zone.region = "Aracaju"
zone.longitude = -37.06766
zone.latitude = -10.909133
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 80
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 81
zone.region = "Recife"
zone.longitude = -34.877065
zone.latitude = -8.046658
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 82
zone.region = "Maceió"
zone.longitude = -35.73496
zone.latitude = -9.665985
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 83
zone.region = "João Pessoa"
zone.longitude = -34.864121
zone.latitude = -7.11509
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 84
zone.region = "Natal"
zone.longitude = -35.198604
zone.latitude = -5.793567
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 85
zone.region = "Fortaleza"
zone.longitude = -38.542298
zone.latitude = -3.716638
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 86
zone.region = "Teresina"
zone.longitude = -42.803364
zone.latitude = -5.091944
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 87
zone.region = "Petrolina"
zone.longitude = -40.502731
zone.latitude = -9.388662
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 88
zone.region = "Juazeiro do Norte"
zone.longitude = -39.307593
zone.latitude = -7.196207
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 89
zone.region = "Picos"
zone.longitude = -41.467003
zone.latitude = -7.077213
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 90
zone.region = "Novas Regiões"
zone.save

zone = Zone.new
zone.ddd = 91
zone.region = "Belém"
zone.longitude = -48.489756
zone.latitude = -1.455396
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 92
zone.region = "Manaus"
zone.longitude = -60.02123
zone.latitude = -3.118662
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 93
zone.region = "Santarém"
zone.longitude = -54.699611
zone.latitude = -2.438489
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 94
zone.region = "Marabá"
zone.longitude = -49.132672
zone.latitude = -5.38075
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 95
zone.region = "Boa Vista"
zone.longitude = -60.675328
zone.latitude = 2.823842
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 96
zone.region = "Macapá"
zone.longitude = -51.06939
zone.latitude = 0.034934
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 97
zone.region = "Caruari"
zone.longitude = -66.908559
zone.latitude = -4.881605
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 98
zone.region = "São Luís"
zone.longitude = -44.282513
zone.latitude = -2.538742
zone.count_of_scammers = rand(1..100)
zone.save

zone = Zone.new
zone.ddd = 99
zone.region = "Imperatriz"
zone.longitude = -47.477726
zone.latitude = -5.518471
zone.count_of_scammers = rand(1..100)
zone.save
puts 'Dados criados com sucesso!'
