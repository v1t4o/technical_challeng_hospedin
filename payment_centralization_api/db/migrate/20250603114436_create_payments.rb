class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.string :product
      t.decimal :value, precision: 8, scale: 2
      t.string :status
      t.datetime :paid_at
      t.string :client_identifier
      t.string :charge_type
      t.string :external_id

      t.timestamps
    end
  end
end
