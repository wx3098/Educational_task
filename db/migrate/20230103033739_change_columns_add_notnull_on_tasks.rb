class ChangeColumnsAddNotnullOnTasks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tasks, :name, false 
    change_column_null :tasks, :detail, false
  end
end
