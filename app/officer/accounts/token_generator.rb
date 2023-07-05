module Accounts
  class TokenGenerator
    attr_reader :customer_xid

    def initialize(customer_xid)
      @customer_xid = customer_xid
    end

    def perform
      return if account.blank?

      account_token = account.account_tokens.new
      account_token.token = token
      account_token.save
    end

    def token
      @token ||= SecureRandom.hex
    end

    private

    def account
      @account ||= Account.find_by customer_xid: customer_xid
    end
  end
end
