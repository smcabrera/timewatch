class RemoveDayAndDurationFromEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :day, :string
    remove_column :entries, :duration, :integer
  end
end
