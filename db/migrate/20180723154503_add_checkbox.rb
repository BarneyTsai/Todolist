class AddCheckbox < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :check, :boolean
  end
end
