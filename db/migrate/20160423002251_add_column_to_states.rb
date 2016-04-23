class AddColumnToStates < ActiveRecord::Migration
  def change
    add_column :states, :price_per_watt, :integer
  end
end
