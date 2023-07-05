json.status 'success'
json.data do
  json.deposit do
    json.id @deposit.transaction_id
    json.deposited_by @deposit.account.customer_xid
    json.status @deposit.status_text
    json.deposited_at @deposit.created_at
    json.amount @deposit.amount
    json.reference_id @deposit.reference_id
  end
end
