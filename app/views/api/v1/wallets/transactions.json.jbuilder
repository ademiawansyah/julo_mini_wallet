json.status 'success'
json.data do
  json.transactions @transactions do |transaction|
    json.id transaction.transaction_id
    json.status transaction.status_text
    json.transacted_at transaction.created_at
    json.type transaction.type.to_s.downcase
    json.amount transaction.amount
    json.reference_id transaction.reference_id
  end
end
