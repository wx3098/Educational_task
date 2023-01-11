class AddLimitDayToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :termination_date, :date, null: false, default:0
  end
end
