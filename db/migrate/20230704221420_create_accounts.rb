class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :customer_xid, index: true, null: false
      t.string :wallet_id, index: true, null: true
      t.boolean :status, default: false
      t.integer :balance, default: 0, null: false
      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
