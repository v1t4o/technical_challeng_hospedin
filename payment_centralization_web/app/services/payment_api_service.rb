class PaymentApiService
  include HTTParty

  base_uri Rails.application.config.api_base_url

  headers 'Content-Type' => 'application/json'

  def self.list_payments(params = {})
    response = get('/payments', query: clean_filters(params))

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
      if response.parsed_response.present? && response.parsed_response['errors'].present?
        Rails.logger.error("Detalhes do erro: #{response.parsed_response['errors']}")
      end
      nil
    end
  end

  private

  def self.clean_filters(filters)
    filters.compact.reject { |key, value| value.to_s.strip.empty? && key.to_s != 'commit' }
  end
end