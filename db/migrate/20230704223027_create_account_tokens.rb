class CreateAccountTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :account_tokens do |t|
      t.references :account
      t.string :token, null: false, index: true
      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
