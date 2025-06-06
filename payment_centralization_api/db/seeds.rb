# payment_centralization_api/db/seeds.rb

puts "Iniciando a criação de dados iniciais..."

Payment.destroy_all
puts "Registros de pagamentos existentes removidos."

payments_data = [
  {
    product: Payment.products[:pms],
    value: 150.75,
    status: Payment.statuses[:confirmed],
    paid_at: Time.current - 1.day,
    client_identifier: 'CLI001',
    charge_type: Payment.charge_types[:recurrent],
    external_id: 'EXT_001_A'
  },
  {
    product: Payment.products[:motor],
    value: 200.00,
    status: Payment.statuses[:pending],
    paid_at: Time.current - 2.days,
    client_identifier: 'CLI002',
    charge_type: Payment.charge_types[:ad_hoc],
    external_id: 'EXT_002_B'
  },
  {
    product: Payment.products[:channel],
    value: 50.20,
    status: Payment.statuses[:failed],
    paid_at: Time.current - 3.days,
    client_identifier: 'CLI003',
    charge_type: Payment.charge_types[:recurrent],
    external_id: 'EXT_003_C'
  },
  {
    product: Payment.products[:pms],
    value: 300.50,
    status: Payment.statuses[:confirmed],
    paid_at: Time.current - 4.days,
    client_identifier: 'CLI001',
    charge_type: Payment.charge_types[:ad_hoc],
    external_id: 'EXT_004_D'
  }
]

payments_data.each do |data|
  payment = Payment.create!(data)
  puts "Pagamento criado: ID #{payment.id}, Produto: #{payment.product}, Valor: R$ #{payment.value}"
rescue ActiveRecord::RecordInvalid => e
  puts "Erro ao criar pagamento: #{data[:product]} - #{e.message}"
end

puts "Criação de dados iniciais finalizada."