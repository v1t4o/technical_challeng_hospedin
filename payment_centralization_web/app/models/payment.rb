class Payment
  include ActiveModel::Attributes
  include ActiveModel::Model
  include ActiveModel::Validations

  attribute :product, :string
  attribute :value, :decimal
  attribute :status, :string
  attribute :paid_at, :datetime
  attribute :client_identifier, :string
  attribute :charge_type, :string

  def self.products
    { pms: 'PMS', motor: 'Motor', channel: 'Channel' }
  end

  def self.statuses
    { pending: 'pendente', confirmed: 'confirmado', failed: 'falhou' }
  end

  def self.charge_types
    { recurrent: 'recorrente', ad_hoc: 'avulsa' }
  end

  def self.product_options_for_select
    products.to_a.map { |key_symbol, value_string| [value_string, key_symbol] }
  end

  def self.status_options_for_select
    statuses.to_a.map { |key_symbol, value_string| [value_string, key_symbol] }
  end

  def self.charge_type_options_for_select
    charge_types.to_a.map { |key_symbol, value_string| [value_string, key_symbol] }
  end
end