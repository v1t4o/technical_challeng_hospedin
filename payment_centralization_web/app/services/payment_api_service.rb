class PaymentApiService
  include HTTParty

  base_uri Rails.application.config.api_base_url

  headers 'Content-Type' => 'application/json'

  def self.list_payments(filters = {})
    response = get('/payments', query: filters)

    if response.success?
      response.parsed_response
    else
      Rails.logger.error("Erro ao listar pagamentos: #{response.code} - #{response.message}")
      []
    end
  end

  def self.create_payment(payment_data)
    response = post('/payments', body: { payment: payment_data }.to_json)

    if response.success?
      response.parsed_response
    else
      Rails.logger.error("Erro ao criar pagamento: #{response.code} - #{response.message}")
      Rails.logger.error("Detalhes do erro: #{response.parsed_response['errors']}" if response.parsed_response.present? && response.parsed_response['errors'].present?)
      nil
    end
  end
end