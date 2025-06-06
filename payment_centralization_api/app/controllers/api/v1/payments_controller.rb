module Api
  module V1
    class PaymentsController < ApplicationController
      def index
        payments = Payment.filter_by_params(filter_params)

        render json: payments, status: :ok
      end

      def create
        @payment = Payment.new(payment_params)

        if @payment.save
          render json: @payment, status: :created
        else
          render json: { errors: @payment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def payment_params
        params.require(:payment).permit(:product, :value, :status, :paid_at, :client_identifier, :charge_type)
      end

      def filter_params
        params.permit(:product, :status, :charge_type, :paid_at_start, :paid_at_end).to_h
      end
    end
  end
end