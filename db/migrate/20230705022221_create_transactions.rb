class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :account
      t.string :type, index: true, null: false
      t.string :transaction_id, index: true, null: false
      t.string :reference_id, index: true, null: false
      t.boolean :status, default: false
      t.integer :amount, default: 0
      t.integer :balance
      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
