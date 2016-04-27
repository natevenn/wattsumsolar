class AddColumnAvgKwhToStates < ActiveRecord::Migration
  def change
    add_column :states, :avg_annaul_kwh, :integer
  end
end
