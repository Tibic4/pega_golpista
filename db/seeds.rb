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
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 2
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 3
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 4
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 5
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 6
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 7
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 8
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 9
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 10
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 11
zone.region = "São Paulo"
zone.long = -46.63952
zone.lat =  -23.532905
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 12
zone.region = "São José dos Campos"
zone.long = -45.884115
zone.lat = -23.189554
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 13
zone.region = "Santos"
zone.long = -46.335042
zone.lat =  -23.953543
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 14
zone.region = "Bauru"
zone.long = -49.087142
zone.lat = -22.324569
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 15
zone.region = "Sorocaba"
zone.long = -47.445073
zone.lat =  -23.496886
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 16
zone.region = "Ribeirão Preto"
zone.long = -47.809875
zone.lat = -21.169923
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 17
zone.region = "São José do Rio Preto"
zone.long = -49.375767
zone.lat =  -20.811289
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 18
zone.region = "Presidente Prudente"
zone.long = -51.392526
zone.lat = -22.120654
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 19
zone.region = "Campinas"
zone.long = -47.06595
zone.lat =  -22.905346
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 20
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 21
zone.region = "Rio de Janeiro"
zone.long = -43.200295
zone.lat =  -22.912897
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 22
zone.region = "Campos dos Goytacazes"
zone.long = -41.318055
zone.lat = -21.762171
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 23
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 24
zone.region = "Petrópolis"
zone.long = -43.192613
zone.lat = -22.519963
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 25
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 26
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 26
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 27
zone.region = "Vitória"
zone.long = -40.312806
zone.lat = -20.315472
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 28
zone.region = "Cachoeiro de Itapemirim"
zone.long = -41.119829
zone.lat =  -20.846212
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 29
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 30
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 31
zone.region = "Belo Horizonte"
zone.long = -43.926572
zone.lat = -19.910183
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 32
zone.region = "Juiz de Fora"
zone.long = -43.339759
zone.lat =  -21.75952
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 33
zone.region = "Gorvernador Valadares"
zone.long = -41.95553
zone.lat = 18.854452
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 34
zone.region = "Uberlândia"
zone.long = -48.274934
zone.lat = -18.914142
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 35
zone.region = "Poços de Caldas"
zone.long = -46.569184
zone.lat = -21.779975
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 36
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 37
zone.region = "Divinópolis"
zone.long = -44.891223
zone.lat =  -20.144646
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 38
zone.region = "Montes Claros"
zone.long = -43.857809
zone.lat = -16.728177
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 39
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 40
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 41
zone.region = "Coritiba"
zone.long = -49.276855
zone.lat = -25.441105
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 42
zone.region = "Ponta Grossa"
zone.long = -50.166787
zone.lat = -25.091622
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 43
zone.region = "Londrina"
zone.long = -51.1691
zone.lat = -23.303975
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 44
zone.region = "Maringá"
zone.long = -51.933298
zone.lat = -23.420545
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 45
zone.region = "Cascavel"
zone.long = -53.459005
zone.lat = -24.957301
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 46
zone.region = "Francisco Beltrão"
zone.long = -53.053466
zone.lat = -26.081677
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 47
zone.region = "Joinville"
zone.long = -48.843380
zone.lat = -26.304516
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 48
zone.region = "Florianópolis"
zone.long = -48.547696
zone.lat = -27.594486
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 49
zone.region = "Chapecó"
zone.long = -52.61519
zone.lat = -27.100448
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 50
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 51
zone.region = "Porto Alegre"
zone.long = -51.206533
zone.lat = -30.031771
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 52
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 53
zone.region = "Pelotas"
zone.long = -52.337058
zone.lat = -31.764898
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 54
zone.region = "Caxias do Sul"
zone.long = -51.179161
zone.lat = -29.162905
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 55
zone.region = "Santa Maria"
zone.long = -53.814946
zone.lat = -29.686817
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 56
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 57
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 58
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 59
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 60
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 61
zone.region = "Distrito Federal"
zone.long = -47.9292
zone.lat =  -15.7801
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 62
zone.region = "Goiania"
zone.long = -49.264346
zone.lat = -16.686439
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 63
zone.region = "Palmas"
zone.long = -48.355751
zone.lat = -10.239973
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 64
zone.region = "Rio Verde"
zone.long = -50.919195
zone.lat = -17.792266
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 65
zone.region = "Cuiabá"
zone.long = -56.097397
zone.lat = -15.600979
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 66
zone.region = "Rondonopolis"
zone.long = -54.637173
zone.lat = -16.467251
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 67
zone.region = "Campo Grande"
zone.long = -54.629463
zone.lat = -20.448589
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 68
zone.region = "Rio Branco"
zone.long = -67.824348
zone.lat = -9.97499
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 69
zone.region = "Porto Velho"
zone.long = -63.899902
zone.lat = -8.760772
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 70
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 71
zone.region = "Salvador"
zone.long = -38.501068
zone.lat = -12.97178
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 72
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 73
zone.region = "Itabuna"
zone.long = -39.278056
zone.lat = -14.787573
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 74
zone.region = "Juazeiro"
zone.long = -40.503251
zone.lat = -9.416217
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 75
zone.region = "Feira de Santana"
zone.long = -38.966293
zone.lat = -12.266429
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 76
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 77
zone.region = "Vitória da Conquista"
zone.long = -40.844159
zone.lat = -14.861466
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 78
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 79
zone.region = "Aracaju"
zone.long = -37.06766
zone.lat = -10.909133
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 80
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 81
zone.region = "Recife"
zone.long = -34.877065
zone.lat = -8.046658
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 82
zone.region = "Maceió"
zone.long = -35.73496
zone.lat = -9.665985
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 83
zone.region = "João Pessoa"
zone.long = -34.864121
zone.lat = -7.11509
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 84
zone.region = "Natal"
zone.long = -35.198604
zone.lat = -5.793567
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 85
zone.region = "Fortaleza"
zone.long = -38.542298
zone.lat = -3.716638
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 86
zone.region = "Teresina"
zone.long = -42.803364
zone.lat = -5.091944
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 87
zone.region = "Petrolina"
zone.long = -40.502731
zone.lat = -9.388662
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 88
zone.region = "Juazeiro do Norte"
zone.long = -39.307593
zone.lat = -7.196207
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 89
zone.region = "Picos"
zone.long = -41.467003
zone.lat = -7.077213
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 90
zone.region = "Novas Regiões"
zone.task_id = rand(1..10)
zone.save


zone = Zone.new
zone.ddd = 91
zone.region = "Belém"
zone.long = -48.489756
zone.lat = -1.455396
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 92
zone.region = "Manaus"
zone.long = -60.02123
zone.lat = -3.118662
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 93
zone.region = "Santarém"
zone.long = -54.699611
zone.lat = -2.438489
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 94
zone.region = "Marabá"
zone.long = -49.132672
zone.lat = -5.38075
zone.task_id = rand(1..10)
zone.save


zone = Zone.new
zone.ddd = 95
zone.region = "Boa Vista"
zone.long = -60.675328
zone.lat = 2.823842
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 96
zone.region = "Macapá"
zone.long = -51.06939
zone.lat = 0.034934
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 97
zone.region = "Caruari"
zone.long = -66.908559
zone.lat = -4.881605
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 98
zone.region = "São Luís"
zone.long = -44.282513
zone.lat = -2.538742
zone.task_id = rand(1..10)
zone.save

zone = Zone.new
zone.ddd = 99
zone.region = "Imperatriz"
zone.long = -47.477726
zone.lat = -5.518471
zone.task_id = rand(1..10)
zone.save
puts 'Dados criados com sucesso!'
