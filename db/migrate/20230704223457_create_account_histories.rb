class CreateAccountHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :account_histories do |t|
      t.references :account
      t.string :action, null: false
      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
