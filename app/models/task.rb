class Task < ActiveRecord::Base
  validates :title, length: { maximum: 32 }

  def self.create_with_date(date)
    @task = Task.new
    year = Time.now.year
    month = Time.now.month
    temp_date = year.to_s + format("%02d", month).to_s + format("%02d", date).to_s
    formatted_date = temp_date.to_date.strftime('%Y-%m-%d')
    @task.date = formatted_date
    @task
  end
end
