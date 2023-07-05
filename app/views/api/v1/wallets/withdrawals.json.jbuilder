json.status 'success'
json.data do
  json.deposit do
    json.id @withdrawal.transaction_id
    json.withdrawn_by @withdrawal.account.customer_xid
    json.status @withdrawal.status_text
    json.withdrawn_at @withdrawal.created_at
    json.amount @withdrawal.amount
    json.reference_id @withdrawal.reference_id
  end
end
