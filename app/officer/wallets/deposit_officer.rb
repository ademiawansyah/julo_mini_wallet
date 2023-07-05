module Wallets
  class DepositOfficer
    attr_reader :account, :reference_id, :amount, :deposit, :error_message

    def initialize(account, reference_id, amount)
      @account = account
      @reference_id = reference_id
      @amount = amount
      @error_message = nil
    end

    def perform
      # validate reference_id
      return unless valid?

      ActiveRecord::Base.transaction do
        @deposit = account.deposits.new
        deposit.transaction_id = transaction_id
        deposit.reference_id = reference_id
        deposit.amount = amount
        deposit.status = true
        deposit.balance = account.balance + amount
        deposit.save
      end

      # NOTE: This method can be improved without directly calculating the balance.
      # NOTE: We can use the status pending, and then use background job management to calculate the balance
      # NOTE: At the background job management, after successfully calculate the balance, and update the account balance, should change the transaction status to successful
      # NOTE: I'm not implementing the background job management because the setup process for it, little bit complicated
    end

    def transaction_id
      SecureRandom.uuid
    end

    def valid?
      @deposit = account.deposits.find_by(reference_id:)

      if deposit.present?
        @error_message = 'Reference ID already exists'
        return
      end
      true
    end
  end
end
