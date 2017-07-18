class DropInstalls < ActiveRecord::Migration[5.1]
  def change
    drop_table :role
  end
end
