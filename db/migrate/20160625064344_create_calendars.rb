class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.references :day, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
