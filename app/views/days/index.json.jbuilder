json.array!(@days) do |day|
  json.extract! day, :id, :log_id
  json.url day_url(day, format: :json)
end
