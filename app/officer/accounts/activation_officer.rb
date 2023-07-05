module Accounts
  class ActivationOfficer
    attr_reader :account, :error_message

    def initialize(account)
      @account = account
      @error_message = nil
    end

    def perform
      if account.status
        @error_message = 'Already Enabled'
        return
      end

      account.status = true
      account.save

      account_history = account.account_histories.new
      account_history.action = 'enabled'
      account_history.save

      @account.reload
    end
  end
end
