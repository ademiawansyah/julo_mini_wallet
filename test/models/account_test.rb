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
require "test_helper"

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
