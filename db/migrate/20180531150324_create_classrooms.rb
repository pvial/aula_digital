class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.integer :nivel_id

      t.timestamps

    end
  end
end
