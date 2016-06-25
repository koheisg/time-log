class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :time
      t.string :title

      t.timestamps null: false
    end
  end
end
