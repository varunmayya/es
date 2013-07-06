json.array!(@events) do |event|
  json.extract! event, :title, :details, :logo_url, :start_date, :start_time, :end_date, :end_time, :address, :city, :zipcode, :category, :is_private
  json.url event_url(event, format: :json)
end
