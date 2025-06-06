class PaymentsController < ApplicationController
  def index
    #Talvez método seja melhor
    filters = params.permit(:product, :status, :charge_type, :paid_at_start, :paid_at_end).to_h

    # Chama o serviço PaymentApiService para listar os pagamentos com os filtros aplicados.
    @payments = PaymentApiService.list_payments(filters)

    # Talvez criar um decorator faça mais sentido
    @products = Payment.products.keys.map { |k| [k.to_s.to_s.humanize, k] }
    @statuses = Payment.statuses.keys.map { |k| [k.to_s.humanize, k] }
    @charge_types = Payment.charge_types.keys.map { |k| [k.to_s.humanize, k] }
  end

  def new
    @payment = Payment.new

    # Decorator novamente
    @products = Payment.products.keys.map { |k| [k.to_s.humanize, k] }
    @statuses = Payment.statuses.keys.map { |k| [k.to_s.humanize, k] }
    @charge_types = Payment.charge_types.keys.map { |k| [k.to_s.humanize, k] }
  end

  def create
    api_response = PaymentApiService.create_payment(payment_params)

    if api_response.present? && api_response['id'].present? 
      redirect_to payments_path, notice: 'Pagamento adicionado com sucesso!'
    else
      # Talvez encapsular em um método faça mais sentido
      @payment = OpenStruct.new(payment_params)
      @payment.errors = ActiveModel::Errors.new(@payment)

      (api_response['errors'] || []).each do |error_msg|
        @payment.errors.add(:base, error_msg)
      end

      # Decorator
      @products = Payment.products.keys.map { |k| [k.to_s.humanize, k] }
      @statuses = Payment.statuses.keys.map { |k| [k.to_s.humanize, k] }
      @charge_types = Payment.charge_types.keys.map { |k| [k.to_s.humanize, k] }

      flash.now[:alert] = 'Erro ao adicionar pagamento. Verifique os dados.'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:product, :value, :status, :paid_at, :client_identifier, :charge_type)
  end
end