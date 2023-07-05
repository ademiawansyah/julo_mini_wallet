module Wallets
  class WithdrawalOfficer
    attr_reader :account, :reference_id, :amount, :withdrawal, :error_message

    def initialize(account, reference_id, amount)
      @account = account
      @reference_id = reference_id
      @amount = amount
      @error_message = nil
    end

    def perform
      # validate reference_id
      return if !valid? || !sufficient_balance?

      ActiveRecord::Base.transaction do
        @withdrawal = account.withdrawals.new
        withdrawal.transaction_id = transaction_id
        withdrawal.reference_id = reference_id
        withdrawal.amount = amount
        withdrawal.status = true
        withdrawal.balance = account.balance - amount
        withdrawal.save
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
      @withdrawal = account.withdrawals.find_by(reference_id:)

      if withdrawal.present?
        @error_message = 'Reference ID already exists'
        return
      end
      true
    end

    def sufficient_balance?
      if account.balance <= amount
        @error_message = 'Insufficient funds'
        return false
      end

      true
    end
  end
end
