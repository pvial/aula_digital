class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :profesor_id

      t.timestamps

    end
  end
end
