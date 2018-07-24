class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :Name
      t.date :Due_Date
      t.text :Note
      t.timestamps
    end
  end
end
