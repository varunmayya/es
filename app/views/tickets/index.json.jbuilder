json.array!(@tickets) do |ticket|
  json.extract! ticket, :name, :description, :price, :quantity, :sales_start_datetime, :sales_end_datetime, :event_id
  json.url ticket_url(ticket, format: :json)
end
