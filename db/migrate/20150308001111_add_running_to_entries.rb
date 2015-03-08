class AddRunningToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :running, :boolean
  end
end
