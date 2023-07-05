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
