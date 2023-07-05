# == Schema Information
#
# Table name: transactions
#
#  id             :bigint           not null, primary key
#  account_id     :bigint
#  type           :string(255)      not null
#  transaction_id :string(255)      not null
#  reference_id   :string(255)      not null
#  status         :boolean          default(FALSE)
#  amount         :integer          default(0)
#  balance        :integer
#  deleted_at     :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
