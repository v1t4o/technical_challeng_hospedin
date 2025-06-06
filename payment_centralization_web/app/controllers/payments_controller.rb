class PaymentsController < ApplicationController
  before_action :humanize_enums_for_payment_index, only: [:index, :new]
  def index
    @payments = PaymentApiService.list_payments(filter_params)
  end

  def new
    @payment = Payment.new
  end

  def create
    api_response = PaymentApiService.create_payment(payment_params)

    if api_response.present? && api_response['id'].present? 
      redirect_to payments_path, notice: 'Pagamento adicionado com sucesso!'
    else
      generate_payment_errors
      
      humanize_enums_for_payment_index

      flash.now[:alert] = 'Erro ao adicionar pagamento. Verifique os dados.'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:product, :value, :status, :paid_at, :client_identifier, :charge_type)
  end

  def generate_payment_errors
    @payment = OpenStruct.new(payment_params)
    @payment.errors = ActiveModel::Errors.new(@payment)

    (api_response['errors'] || []).each do |error_msg|
      @payment.errors.add(:base, error_msg)
    end
  end

  def humanize_enums_for_payment_index
    @products = Payment.product_options_for_select
    @statuses = Payment.status_options_for_select
    @charge_types = Payment.charge_type_options_for_select
  end

  def filter_params
    params.permit(:product, :status, :charge_type, :paid_at_start, :paid_at_end).to_h
  end
end