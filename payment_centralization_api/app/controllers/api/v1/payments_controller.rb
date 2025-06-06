module Api
  module V1
    class PaymentsController < ApplicationController
      def index
        payments = Payment.all

        #Encapsular no model
        payments = payments.where(product: params[:product]) if params[:product].present?
        payments = payments.where(status: params[:status]) if params[:status].present?
        payments = payments.where(charge_type: params[:charge_type]) if params[:charge_type].present?

        payments = payments.where('paid_at >= ?', params[:paid_at_start]) if params[:paid_at_start].present?
        payments = payments.where('paid_at <= ?', params[:paid_at_end]) if params[:paid_at_end].present?

        # Talvez um serializer?
        render json: payments, status: :ok
      end

      def create
        @payment = Payment.new(payment_params)

        if @payment.save
          # Serializer?
          render json: @payment, status: :created
        else
          # Serializer?
          render json: { errors: @payment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def payment_params
        params.require(:payment).permit(:product, :value, :status, :paid_at, :client_identifier, :charge_type)
      end
    end
  end
end