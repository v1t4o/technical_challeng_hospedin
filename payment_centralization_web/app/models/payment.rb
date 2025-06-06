class Payment
  include ActiveModel::Attributes
  # include ActiveModel::Model
  # include ActiveModel::Validations

  def self.products
    { pms: 'PMS', motor: 'Motor', channel: 'Channel' }
  end

  def self.statuses
    { pending: 'pendente', confirmed: 'confirmado', failed: 'falhou' }
  end

  def self.charge_types
    { recurrent: 'recorrente', ad_hoc: 'avulsa' }
  end

  attribute :product, :string
  attribute :value, :decimal
  attribute :status, :string
  attribute :paid_at, :datetime
  attribute :client_identifier, :string
  attribute :charge_type, :string
end