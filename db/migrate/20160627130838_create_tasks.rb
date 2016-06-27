class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :duration
      t.date :date

      t.timestamps null: false
    end
  end
end
