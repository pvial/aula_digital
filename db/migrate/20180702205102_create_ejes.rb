class CreateEjes < ActiveRecord::Migration
  def change
    create_table :ejes do |t|
      t.integer :materia_id
      t.text :description

      t.timestamps

    end
  end
end
