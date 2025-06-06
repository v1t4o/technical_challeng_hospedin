class Payment < ApplicationRecord
  enum product: { pms: 'PMS', motor: 'Motor', channel: 'Channel' }
  enum status: { pending: 'pendente', confirmed: 'confirmado', failed: 'falhou' }
  enum charge_type: { recurrent: 'recorrente', ad_hoc: 'avulsa' }

  validates :product, presence: true
  validates :value, presence: true, numericality: { greater_than: 0 }
  validates :paid_at, presence: true
  validates :client_identifier, presence: true
  validates :charge_type, presence: true

  before_create :request_pagarme_transaction

  scope :by_product, ->(product) { where(product: product) }

  scope :by_status, ->(status) { where(status: status) }

  scope :by_charge_type, ->(charge_type) { where(charge_type: charge_type) }

  scope :paid_after, ->(start_date) { where('paid_at >= ?', start_date) }

  scope :paid_before, ->(end_date) { where('paid_at <= ?', end_date) }

  scope :filter_by_params, ->(params) do
    payments = all

    payments = payments.by_product(params[:product]) if params[:product].present?
    payments = payments.by_status(params[:status]) if params[:status].present?
    payments = payments.by_charge_type(params[:charge_type]) if params[:charge_type].present?
    payments = payments.paid_after(params[:paid_at_start]) if params[:paid_at_start].present?
    payments = payments.paid_before(params[:paid_at_end]) if params[:paid_at_end].present?

    payments
  end

  private

  def request_pagarme_transaction
    self.external_id = "pagarme_txn_#{SecureRandom.hex(8)}"

    if rand(100) < 80
      self.status = :confirmed
    else
      self.status = :failed
    end

    Rails.logger.info("Simulate Pagar.me for payment #{self.external_id}. Status: #{self.status.humanize}")
  end
end