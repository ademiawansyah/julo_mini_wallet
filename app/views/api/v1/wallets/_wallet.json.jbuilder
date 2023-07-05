json.wallet do
  json.id @account.wallet_id
  json.owned_by @account.customer_xid
  json.status @account.status_text
  json.enabled_at @account.enabled_at
  json.balance @account.balance
end
