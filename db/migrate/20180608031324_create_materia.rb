class CreateMateria < ActiveRecord::Migration
  def change
    create_table :materia do |t|
      t.text :description

      t.timestamps

    end
  end
end
