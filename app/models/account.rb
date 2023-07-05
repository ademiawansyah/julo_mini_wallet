# == Schema Information
#
# Table name: accounts
#
#  id           :bigint           not null, primary key
#  customer_xid :string(255)      not null
#  wallet_id    :string(255)
#  status       :boolean          default(FALSE)
#  balance      :integer          default(0), not null
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Account < ApplicationRecord
  has_many :account_tokens, dependent: :destroy
  has_many :account_histories, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :deposits, dependent: :destroy
  has_many :withdrawals, dependent: :destroy

  def status_text
    status ? 'enabled' : 'disabled'
  end

  def enabled_at
    account_histories.where(action: 'enabled').last&.created_at
  end
end
