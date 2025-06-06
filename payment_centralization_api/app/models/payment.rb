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

  private

  def simulate_pagarme_transaction
    self.external_id = "pagarme_txn_#{SecureRandom.hex(8)}"

    if rand(100) < 80
      self.status = :confirmed
    else
      self.status = :failed
    end

    Rails.logger.info("Simulate Pagar.me for payment #{self.external_id}. Status: #{self.status.humanize}")
  end
end