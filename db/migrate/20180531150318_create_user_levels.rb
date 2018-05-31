class CreateUserLevels < ActiveRecord::Migration
  def change
    create_table :user_levels do |t|
      t.integer :user_id
      t.integer :general
      t.integer :eje_1_placeholder
      t.integer :eje_2_placeholder
      t.integer :materia_id
      t.date :date

      t.timestamps

    end
  end
end
