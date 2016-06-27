json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :duration, :date
  json.url task_url(task, format: :json)
end
