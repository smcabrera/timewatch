class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :day
      t.datetime :start
      t.datetime :stop
      t.integer :duration
      t.string :notes

      t.timestamps
    end
  end
end
