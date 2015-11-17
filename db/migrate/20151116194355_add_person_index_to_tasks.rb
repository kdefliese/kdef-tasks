class AddPersonIndexToTasks < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      add_column :tasks, :person_id, :integer
    end

    add_index :tasks, :person_id
  end


end
