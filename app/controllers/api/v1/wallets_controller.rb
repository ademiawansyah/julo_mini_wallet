class Api::V1::WalletsController < ApplicationController
  before_action :authorize_token
  before_action :wallet_status, only: %i[index transactions deposits withdrawals]
  before_action :deposit_withdrawals_params, only: %i[deposits withdrawals]

  def create
    activation_officer = Accounts::ActivationOfficer.new(@account)
    activation_officer.perform
    @account = activation_officer.account

    return unless activation_officer.error_message.present?

    raise ActionController::BadRequest, activation_officer.error_message
  end

  def index; end

  def update
    return if @account.update!({ status: !params[:is_disabled] })

    raise ActionController::BadRequest, activation_officer.error_message
  end

  def transactions
    @transactions = @account.transactions
  end

  def deposits
    deposit_officer = Wallets::DepositOfficer.new(@account, @reference_id, @amount)
    deposit_officer.perform
    @deposit = deposit_officer.deposit

    return unless deposit_officer.error_message.present?

    raise ActionController::BadRequest, deposit_officer.error_message
  end

  def withdrawals
    withdrawal_officer = Wallets::WithdrawalOfficer.new(@account, @reference_id, @amount)
    withdrawal_officer.perform
    @withdrawal = withdrawal_officer.withdrawal

    return unless withdrawal_officer.error_message.present?

    raise ActionController::BadRequest, withdrawal_officer.error_message
  end

  private

  def wallet_status
    return if @account.status

    raise ActionController::BadRequest, 'Wallet Disabled'
  end

  def deposit_withdrawals_params
    param! :reference_id, String, required: true, blank: false

    @reference_id = params[:reference_id]
    @amount = params[:amount].to_i
  end
end
