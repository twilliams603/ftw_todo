class Task < ActiveRecord::Migration
  def change
  	create_table :tasks do |t|
  		t.string :name
  		t.text :notes
  		t.datetime :due_date
  		t.boolean :completed

  		t.timestamps
  	end
  end
end

