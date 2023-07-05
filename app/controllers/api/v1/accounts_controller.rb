class Api::V1::AccountsController < ApplicationController
  before_action :init_params, only: :init

  def init
    customer_xid = params[:customer_xid]
    Accounts::InitOfficer.new(customer_xid).perform
    token_officer = Accounts::TokenGenerator.new(customer_xid)
    token_officer.perform

    @token = token_officer.token
  end

  private

  def init_params
    param! :customer_xid, String, required: true, blank: false
  end
end
