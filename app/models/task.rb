class Task < ActiveRecord::Base
  validates :title, length: { maximum: 32 }
end
