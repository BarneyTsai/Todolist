class RenameAll < ActiveRecord::Migration[5.1]
  def change
    rename_column :todos, :Name, :name
    rename_column :todos, :Due_Date, :due_date
    rename_column :todos, :Note, :note
  end
end
