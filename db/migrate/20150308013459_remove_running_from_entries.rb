class RemoveRunningFromEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :running, :boolean
  end
end
