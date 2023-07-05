module Accounts
  class InitOfficer
    attr_reader :customer_xid

    def initialize(customer_xid)
      @customer_xid = customer_xid
    end

    def perform
      return if customer_xid.blank?
      return unless account.wallet_id.blank?

      account.wallet_id = SecureRandom.uuid
      account.save
    end

    def account
      @account ||= Account.find_or_create_by(customer_xid:)
    end
  end
end
